// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weatherapp/app/data/models/weather_model.dart';
import 'package:weatherapp/services/providers/service_provider.dart';
import 'package:xml/xml.dart';

class HomeController extends GetxController {
  final weatherList = <WeatherModel>[].obs;

  final isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    final locationData = await getLocation();
    final response = await fetchWeatherByLatLong(long: locationData.$1, lat: locationData.$2);
    response! ? isLoading.value = false : isLoading.value = true;
    final result = await fetchWeatherByXML(long: locationData.$1, lat: locationData.$2);
    if (result!) {}

    // final response = await fetchWeather();
    // response! ? isLoading.value = false : isLoading.value = true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool?> fetchWeather({String location = 'Baliuag'}) async {
    final response = await ServiceProvider.getWeather(location: location);
    if (response!.weather.isNotEmpty) {
      weatherList.clear();
      weatherList.add(response);
      return true;
    }
    return false;
  }

  Future<bool?> fetchWeatherByLatLong({required double? long, required double? lat}) async {
    final response = await ServiceProvider.getWeatherByLongLat(longtitude: long!, latitude: lat!);
    if (response!.weather.isNotEmpty) {
      weatherList.clear();
      weatherList.add(response);
      return true;
    }
    return false;
  }

  Future<bool?> fetchWeatherByXML({required double? long, required double? lat}) async {
    final response = await ServiceProvider.getWeatherByLongLatByXML(longtitude: long!, latitude: lat!);

    final document = XmlDocument.parse(response);
    print(document.toString());
    print(document.toXmlString(pretty: true, indent: '\t'));

    return true;
  }

  Future<(double?, double?)> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      // if (permissionGranted != PermissionStatus.granted) {
      //   return;
      // }
    }

    locationData = await location.getLocation();
    return (locationData.longitude, locationData.latitude);
  }
}
