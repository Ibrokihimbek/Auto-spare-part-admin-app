import 'package:admin_aplication/data/api/api_service.dart';
import 'package:admin_aplication/data/models/latlong/lat_long.dart';
import 'package:admin_aplication/data/models/my_response/response_model.dart';

class GeocodingRepo {
  GeocodingRepo({required this.apiService});

  final ApiService apiService;

  Future<AppResponse> getAddress(LatLong latLong, String kind) =>
      apiService.getLocationName(
          geoCodeText: "${latLong.longitude},${latLong.lattitude}", kind: kind);
}
