import 'package:arkatrack/common/utils/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationServices extends GetxService {
  final Distance distance = const Distance();

  final RxDouble currentLatitude = 0.0.obs;
  final RxDouble currentLongitude = 0.0.obs;

  Future<Either<String, Position>> getCurrentLatLong() async {
    try {
      final locationData = await Geolocator.getCurrentPosition();
      return Right(locationData);
    } catch (e) {
      setCurrentLatLong(0.0, 0.0);
      return Left(e.toString());
    }
  }

  void setCurrentLatLong(double latitude, double longitude) {
    currentLatitude.value = latitude;
    currentLongitude.value = longitude;
  }

  double getDistance(LatLng p1, LatLng p2) {
    return distance(p1, p2);
  }

  double getDistanceInUnit(LengthUnit unit, LatLng p1, LatLng p2) {
    return distance.as(unit, p1, p2);
  }

  double getDistanceInMeters(LatLng p1, LatLng p2) {
    return distance.as(LengthUnit.Meter, p1, p2);
  }

  double getDistanceInKilometers(LatLng p1, LatLng p2) {
    return distance.as(LengthUnit.Kilometer, p1, p2);
  }

  double getDistanceInMiles(LatLng p1, LatLng p2) {
    return distance.as(LengthUnit.Mile, p1, p2);
  }
}
