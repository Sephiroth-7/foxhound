import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[100],
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.greenAccent,
          size: 50,
        ),
      ),
    );
  }
}
