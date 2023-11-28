import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatefulWidget {
  @override
  _CurrencyConverterAppState createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {
  double inputAmount = 0.0;
  double convertedAmount = 0.0;
  String selectedCurrencyFrom = 'IDR';
  String selectedCurrencyTo = 'USD';

  Map<String, double> exchangeRates = {
    'IDR': 1.0, // 1 IDR = 1 IDR
    'USD': 0.000071, // 1 IDR = 0.000071 USD
    'EUR': 0.000061, // 1 IDR = 0.000061 EUR
  };

  void convertCurrency() {
    setState(() {
      double amountInIDR = inputAmount / exchangeRates[selectedCurrencyFrom]!;
      convertedAmount = amountInIDR * exchangeRates[selectedCurrencyTo]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Transform.scale(
            scale: 1.2, // Ubah nilai scale sesuai kebutuhan
            child: Image.asset(
              "assets/images/currency.png", // Ganti dengan path file logo yang sesuai di direktori assets
            ),
          ),
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Currency Converter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    inputAmount = double.parse(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Nilai',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Text(
                      'Dari : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCurrencyFrom,
                        onChanged: (value) {
                          setState(() {
                            selectedCurrencyFrom = value!;
                          });
                        },
                        items: exchangeRates.keys.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(
                              currency,
                              style: TextStyle(color: Colors.black), // Change the text color
                            ),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.black), // Change the selected item text color
                        underline: Container(
                          height: 2,
                          color: Colors.white, // Change the dropdown underline color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Text(
                      'Konversi ke : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCurrencyTo,
                        onChanged: (value) {
                          setState(() {
                            selectedCurrencyTo = value!;
                          });
                        },
                        items: exchangeRates.keys.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(
                              currency,
                              style: TextStyle(color: Colors.black), // Change the text color
                            ),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.black), // Change the selected item text color
                        underline: Container(
                          height: 2,
                          color: Colors.white, // Change the dropdown underline color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: convertCurrency,
                child: Text('Konversi'),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '$convertedAmount $selectedCurrencyTo',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: convertedAmount > 0.0 ? Colors.green : Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CurrencyConverterApp());
}
