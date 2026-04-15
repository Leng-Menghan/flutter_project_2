import 'package:flutter_project_2/data/repositories/booking/booking_repository.dart';
import 'package:flutter_project_2/model/booking/booking.dart';

class BookingRepositoryMock implements BookingRepository{
  final List<Booking> _bookings = [];

  @override
  Future<List<Booking>> fetchBookings() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _bookings;
    });
  }
  
  @override
  Future<void> setBookings(Booking booking) async {
    _bookings.add(booking);
  }
}