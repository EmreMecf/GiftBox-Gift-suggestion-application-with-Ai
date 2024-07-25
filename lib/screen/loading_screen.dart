import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/home");
    });

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assest/logo.png"),
            fit: BoxFit.fitWidth,
        ),
      ),
      child: const Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 75,
          duration: Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
