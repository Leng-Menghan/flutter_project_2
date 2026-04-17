import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/booking/booking.dart';
import '../../config/firebase_config.dart';
import '../../dtos/booking_dto.dart';
import 'booking_repository.dart';

class BookingRepositoryFirebase implements BookingRepository {

  @override
  Future<List<Booking>> fetchBookings() async {

    // 2. Otherwise fetch from API
    final Uri bookingsUriGet = FirebaseConfig.baseUri.replace(path: "/bookings.json");
    final http.Response response = await http.get(bookingsUriGet);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of Bookings
      if (response.body == "null") return [];

      Map<String, dynamic>? bookingsJson = json.decode(response.body);

      List<Booking> result = [];
      for (final entry in bookingsJson!.entries) {
        result.add(BookingDto.fromJson(entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load bookings');
    }
  }
  
  @override
  Future<void> setBookings(Booking booking) async {
    final Uri bookingUriPost = FirebaseConfig.baseUri.replace(path: "/bookings.json");
    final response = await http.post(
      bookingUriPost,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(BookingDto.toJson(booking)),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to add booking");
    }
  }
}