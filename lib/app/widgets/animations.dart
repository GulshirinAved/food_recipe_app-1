import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

LottieBuilder playAnimation() {
  return Lottie.asset(
    'assets/animation/1.json',
    height: 45.h,
    reverse: true,
    repeat: true,
    fit: BoxFit.cover,
  );
}

LottieBuilder writeOwnRecipe() {
  return Lottie.asset(
    'assets/animation/2.json',
    height: 130.h,
    reverse: true,
    repeat: true,
    fit: BoxFit.cover,
  );
}

dynamic loading() {
  return Center(child: Lottie.asset('assets/animation/3.json', height: 200, reverse: true, repeat: true, fit: BoxFit.cover));
}

Center nolike(context) {
  return Center(
    child: Lottie.asset('assets/animation/5.json', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, reverse: true, repeat: true, fit: BoxFit.cover),
  );
}

Center nowifi(context) {
  return Center(child: Lottie.asset('assets/animation/6.json', height: 150, reverse: true, repeat: true, fit: BoxFit.cover));
}
