import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/home_page/views/bottom_nav_bar.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';

import '../../widgets/animations.dart';

class ConnectionCheckpage extends StatefulWidget {
  const ConnectionCheckpage({Key? key}) : super(key: key);

  @override
  _ConnectionCheckpageState createState() => _ConnectionCheckpageState();
}

class _ConnectionCheckpageState extends State with TickerProviderStateMixin {
  late Animation animation1;

  double _containerOpacity = 0.0;
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    checkConnection();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerOpacity = 1;
      });
    });
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const BottomNavBar();
              },
            ),
          );
        });
      }
    } on SocketException catch (_) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: borderRadius15),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 43, left: 12, right: 12, bottom: 30),
              decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  nowifi(context),
                  Text(
                    'No connection',
                    style: TextStyle(
                      fontSize: 27,
                      color: AppColors().blackColor,
                      fontFamily: fontGilroyMediumFont,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    child: Text(
                      'Unable to connect to the Internet. Please check Internet and region!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors().blackColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        checkConnection();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().lilyColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: borderRadius10,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                    child: Text(
                      'Try again',
                      style: TextStyle(fontSize: 18, color: AppColors().whiteColor, fontFamily: fontGilroyMediumFont),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: _containerOpacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors().whiteColor,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          'assets/logo/1.png',
                          height: 200,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      textForHomePage(context, 'Hot Recipe', 20, true, AppColors().blackColor, false, true)
                    ],
                  ),
                ),
              ),
            ),
          ),
          const LinearProgressIndicator()
        ],
      ),
    );
  }
}
