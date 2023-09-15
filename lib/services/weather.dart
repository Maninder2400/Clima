import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '21239cfa02ecd807f9f4ddaff33e21ac';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.latitude}&appid=$apiKey&units=metric');

    var weatherData = await networkingHelper.getData();

    print(location.latitude);
    print(location.longitude);

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
