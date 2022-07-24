// ignore_for_file: camel_case_types, prefer_const_constructors, unused_local_variable
import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  void getLocationAccess() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background1.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Welcome to Clima App\nto use This App Give Me Location Permission",
                style: TextStyle(color: Colors.white, fontSize: 49),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: () async {
                  if (await Permission.location.request().isGranted) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoadingScreen();
                    }));
                  }
                },
                child: Text("Give Permission"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
