import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const CustomLoadingIndicator({
    Key? key,
    this.size = 50.0,
    this.color = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWaveSpinner(curve: Curves.easeInOut,
        trackColor: Colors.grey,
        waveColor: Colors.orange,
        size: size, color: color,
      )
    );
  }
}
