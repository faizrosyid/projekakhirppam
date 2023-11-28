import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class TimeConverterApp extends StatefulWidget {
  @override
  _TimeConverterAppState createState() => _TimeConverterAppState();
}

class _TimeConverterAppState extends State<TimeConverterApp> {
  late DateTime currentTime;
  late DateTime convertedTime;
  String selectedTimezone = 'WIB';

  void convertTime() {
    setState(() {
      switch (selectedTimezone) {
        case 'WIB':
          convertedTime = currentTime;
          break;
        case 'WIT':
          convertedTime = currentTime.add(Duration(hours: 1));
          break;
        case 'WITA':
          convertedTime = currentTime.add(Duration(hours: 2));
          break;
        case 'London':
          convertedTime = currentTime.add(Duration(hours: 7));
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    convertedTime = currentTime;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading:  Transform.scale(
            scale: 1.3, // Ubah nilai scale sesuai kebutuhan
            child: Image.asset(
              "assets/images/time.png", // Ganti dengan path file logo yang sesuai di direktori assets
            ),
          ),
          title: Text(
            'Time Converter',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Current Time',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    color: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${DateFormat('HH:mm:ss').format(currentTime)}',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButton<String>(
                    value: selectedTimezone,
                    onChanged: (value) {
                      setState(() {
                        selectedTimezone = value!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'WIB',
                        child: Text('WIB'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'WIT',
                        child: Text('WIT'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'WITA',
                        child: Text('WITA'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'London',
                        child: Text('London'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: convertTime,
                    child: Text('Convert'),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Converted Time',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    color: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${DateFormat('HH:mm:ss').format(convertedTime)}',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(TimeConverterApp());
}