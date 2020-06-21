import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'dart:convert';
import 'package:country_list_pick/country_list_pick.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  int codeNumberPhone;
  String textNumberPhone;
  String phoneCodeInitial = '+62';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 8.0, top: 150, right: 8, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                    child: Text(
                  'Log in by your phone number',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )),
                SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CountryListPick(
                      // to show or hide flag
                      isShowFlag: true,
                      // true to show  title country
                      isShowTitle: false,
                      // true to show code phone country
                      isShowCode: true,
                      // to show or hide down icon
                      isDownIcon: true,
                      // to initial code number countrey
                      initialSelection: phoneCodeInitial,
                      // to get feedback data from picker
                      onChanged: (CountryCode code) {
                        setState(() {
                          // ignore: unnecessary_statements
                          if (code.dialCode != null) {
                            phoneCodeInitial = code.dialCode;
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Container(
//                        width: 100,
//                        height: 100,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              textNumberPhone = text;
                              print('=======++++++');
                              print(textNumberPhone);
                            });
                          },
                          decoration:
                              InputDecoration(labelText: "Enter your number"),
                          style: TextStyle(fontSize: 18, color: Colors.red),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ], //
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 64,
                ),
                ButtonTheme(
                  height: 60,
                  minWidth: 60,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Owner',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        print(' $phoneCodeInitial = $textNumberPhone');
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
