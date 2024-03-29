import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton<T extends Widget, G extends Gradient> extends StatelessWidget{
  final T child;
  final G? gradient;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final Function onPressed;

  GradientButton({Key? key,
    required this.child,
    this.gradient,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.borderRadius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 48,
      decoration: BoxDecoration(borderRadius: borderRadius, gradient: gradient ?? const LinearGradient(
          colors: [Color(0xFF0185FF), Color(0xFF6324CA)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
      ), boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),

      ]),
      child: Material(
        borderRadius: borderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
            onTap: (){onPressed.call();},
            child: Center(
              child: child,
            )),

      ),
    );
  }
}