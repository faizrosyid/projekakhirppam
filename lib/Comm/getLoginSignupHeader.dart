import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
String headerName;
genLoginSignupHeader(this.headerName);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30.0),
          Container(
              height: 200,
              width: 300,
              child: Image.asset("assets/images/logo.png")),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0),
          ),
          SizedBox(height: 10.0),
          Text(
            'WeatherApp',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black26,
                fontSize: 20.0),
          ),
        ],
      ),

    );
  }
}
