import '../../../model/bike/bike.dart';

abstract class BikeRepository {
  Future<List<Bike>> fetchBikes();
  Future<void> updateBikeStatus(Bike bike);
}