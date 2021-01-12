import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Statefull App Example",
    home: FavroitCity(),
  ));
}

class FavroitCity extends StatefulWidget {
  @override
  _FavroitCityState createState() => _FavroitCityState();
}

class _FavroitCityState extends State<FavroitCity> {
  //Defining Properties that might changes in future

  String nameCity = "";
  var _currencies = ['Rupees', 'Dollar', 'Pounds', 'Others'];
  var _currentItemSelected = 'Rupees'; //for bydefault
  @override
  Widget build(BuildContext context) {
    debugPrint("Favorite city widget is created.");

    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Example'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                //we can used unchanged event handler
                setState(() {
                  debugPrint(
                      'set State is called, this tells framework to redraw the FavCity widget');
                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map(
                (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem));
                },
              ).toList(),
              onChanged: (String newValueSelected) {
                //your code to execute, when a menu item is selected from dropdown
                _onDropDownItemSelected(newValueSelected);
              },
              //This value notify which item is selected by user
              value: _currentItemSelected,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Your best city is $nameCity',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

//We have defined this setstate in here bcz in future we might have to add more codes.
  void _onDropDownItemSelected(String newValueSelected) {
    setState(
      () {
        this._currentItemSelected = newValueSelected;
      },
    );
  }
}
