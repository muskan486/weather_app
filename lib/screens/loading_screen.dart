import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }


  void getLocationData() async
  {

    WeatherModel weatherModel = WeatherModel();
    var weatherData=await weatherModel.getLocationWeather();
      Navigator.push(context, MaterialPageRoute(builder: (context)
      {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitChasingDots(
              color:Colors.orange,
          size: 100.0,
),
),

    );
  }
}
//