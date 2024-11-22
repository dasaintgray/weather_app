class ServiceConstant {
  static const Map<String, String> httpHeader = {
    'content-type': 'application/json',
  };

  static const Map<String, String> xmlHeader = {
    'content-type': 'application/xml, charset=utf-8',
  };

  // timeout
  static const int receiveTimeOut = 20;
  static const int connectionTimeOut = 25;

  // endpoint
  static const String baseURL = 'http://api.openweathermap.org/data/2.5';
  static const String weatherEndPoint = '/weather?APPID=&units=metric';
  // https://api.openweathermap.org/data/2.5/weather?APPID=&units=metric&q=London

  // endpoint params - xml type
  static const String xmlMode = '&mode=xml';

  // image location
  static const String weatherImage = 'http://openweathermap.org/img/w/';
}
