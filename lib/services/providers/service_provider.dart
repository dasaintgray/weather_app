import 'package:weatherapp/app/data/models/weather_model.dart';

import '../base/network_service.dart';
import '../constant/service_constant.dart';

class ServiceProvider {
  static Future<WeatherModel?> getWeather({required String location}) async {
    final response = await NetworkService.get(
      ServiceConstant.baseURL,
      '${ServiceConstant.weatherEndPoint}&q=$location',
      ServiceConstant.httpHeader,
    );
    if (response != null) {
      return weatherModelFromJson(response);
    }
    return null;
  }

  static Future<WeatherModel?> getWeatherByLongLat({required double longtitude, required double latitude}) async {
    final response = await NetworkService.get(
      ServiceConstant.baseURL,
      '${ServiceConstant.weatherEndPoint}&lat=$latitude&lon=$longtitude',
      ServiceConstant.httpHeader,
    );
    if (response != null) {
      return weatherModelFromJson(response);
    }
    return null;
  }

  static Future getWeatherByLongLatByXML({required double longtitude, required double latitude}) async {
    final response = await NetworkService.get(
      ServiceConstant.baseURL,
      '${ServiceConstant.weatherEndPoint}&lat=$latitude&lon=$longtitude&mode=xml',
      ServiceConstant.xmlHeader,
    );
    if (response != null) {
      return response;
    }
    return null;
  }
}
