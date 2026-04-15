import 'package:flutter_project_2/model/booking/booking.dart';

abstract class BookingRepository {
  Future<List<Booking>> fetchBookings();
  Future<void> setBookings(Booking booking);
}