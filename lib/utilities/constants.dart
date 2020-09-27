import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 50.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 30.0,
);
const kConditionTextStyle=TextStyle(
  fontSize: 50.0,
);
const kTempTextStyle = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 60.0,
);
const kApiKey='5f1a4504389836514a478ee27097d95f';
const kTextFieldInputDecoration=InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city,color: Colors.white,),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide: BorderSide.none,
  ),
);