import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gradient_button.dart';

class ResultBlock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 277,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21)
      ),
      child: Padding(
        padding: EdgeInsets.all(27),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 26),
                child: const Text("Results", style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.w100))),
            
            Container(
              margin: const EdgeInsets.only(top: 46),
              child: GradientButton(
                  height: 47,
                  borderRadius: BorderRadius.circular(63),
                  onPressed: (){
                    //Provider.of<GlobalKey<NavigatorState>>(context, listen: false).currentState!.pushNamed(routeQuiz);
                  },
                  width: MediaQuery.of(context).size.width,
                  child: const Text("Try again", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
            )
          ]))
    );
  }
}