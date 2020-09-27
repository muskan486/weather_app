
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/constants.dart';

const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{
  Future<dynamic>getCityNetwork(String cityName)async
  {
    var url='$openWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic>getLocationWeather()async
  {
    Location location =new Location();
    await location.getLocationService();

    NetworkHelper networkHelper=NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metrics');
    var weatherData =await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition)
  {
    if(condition<300)
      {
        return '🌩';
      }
    else if(condition <400)
      {
        return '🌧';
      }
    else if(condition<600)
      {
        return '☔';
      }
    else if(condition<700)
    {
      return '☃';
    }
    else if(condition<800)
    {
      return '🌫';
    }
    else if(condition==800)
    {
      return '☀';
    }
    else if(condition<=804)
    {
      return '☁';
    }
    else
    {
      return '🤷‍';
    }
  }
  String getMessage(int temp)
  {
    if(temp>25)
      {
        return 'It\'s ice-cream time';
      }
    else if(temp>20)
      {
        return 'Time for shorts and sweater';
  }
    else if(temp<10)
      {
        return 'You\'ll need gloves and muffler';
      }
    else{
      return 'Bring a jacket just in case';
    }
  }


}