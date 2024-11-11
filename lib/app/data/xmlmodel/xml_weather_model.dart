// To parse this JSON data, do
//
//     final welcome5 = welcome5FromJson(jsonString);

import 'dart:convert';

xmlWeatherFromJson(String str) => XmlWeatherModel.fromJson(json.decode(str));

String xmlWeatherModelToJson(XmlWeatherModel data) => json.encode(data.toJson());

class XmlWeatherModel {
  XmlWeatherModel({
    required this.current,
  });

  Current current;

  factory XmlWeatherModel.fromJson(Map<String, dynamic> json) => XmlWeatherModel(
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
      };
}

class Current {
  Current({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.wind,
    required this.clouds,
    required this.visibility,
    required this.precipitation,
    required this.weather,
    required this.lastupdate,
  });

  City city;
  String temperature;
  String feelsLike;
  String humidity;
  String pressure;
  Wind wind;
  String clouds;
  String visibility;
  String precipitation;
  String weather;
  String lastupdate;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        city: City.fromJson(json["city"]),
        temperature: json["temperature"],
        feelsLike: json["feels_like"],
        humidity: json["humidity"],
        pressure: json["pressure"],
        wind: Wind.fromJson(json["wind"]),
        clouds: json["clouds"],
        visibility: json["visibility"],
        precipitation: json["precipitation"],
        weather: json["weather"],
        lastupdate: json["lastupdate"],
      );

  Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "temperature": temperature,
        "feels_like": feelsLike,
        "humidity": humidity,
        "pressure": pressure,
        "wind": wind.toJson(),
        "clouds": clouds,
        "visibility": visibility,
        "precipitation": precipitation,
        "weather": weather,
        "lastupdate": lastupdate,
      };
}

class City {
  City({
    required this.coord,
    required this.country,
    required this.timezone,
    required this.sun,
  });

  String coord;
  String country;
  int timezone;
  String sun;

  factory City.fromJson(Map<String, dynamic> json) => City(
        coord: json["coord"],
        country: json["country"],
        timezone: json["timezone"],
        sun: json["sun"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord,
        "country": country,
        "timezone": timezone,
        "sun": sun,
      };
}

class Wind {
  Wind({
    required this.speed,
    required this.gusts,
    required this.direction,
  });

  String speed;
  String gusts;
  String direction;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        gusts: json["gusts"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "gusts": gusts,
        "direction": direction,
      };
}
