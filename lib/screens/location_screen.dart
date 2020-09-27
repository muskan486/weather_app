import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
WeatherModel weather =new WeatherModel();
  int temp;
  String weatherIcon;
  String cityName;
  String msg;

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }

void updateUI(dynamic weatherData)
{
setState(() {
  if(weatherData==null)
    {
      temp=0;
      weatherIcon='error';
      msg='unable to fetch details';
      cityName='';
      return;

    }
  var condition= weatherData['weather'][0]['id'];
  weatherIcon=weather.getWeatherIcon(condition);
  msg=weather.getMessage(temp)  ;
  double temperature=weatherData['main']['temp'];
  temp=temperature.toInt();
  cityName=weatherData['name'];


});


}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location3_image.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async
                    {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size:30.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: ()async
                    {
                      var typedName=await Navigator.push(context,MaterialPageRoute(builder: (context)
                      {
                        return CityScreen();
                      },
                      ),
                      );
                      if(typedName != null){
                        var weatherData=await weather.getCityNetwork(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size:30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '$msg in $cityName',
                  textAlign: TextAlign.center,
                  style:kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
