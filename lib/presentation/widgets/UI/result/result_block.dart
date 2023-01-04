import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gradient_button.dart';

class ResultBlock extends StatelessWidget {
  const ResultBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(21)),
        child: Padding(
            padding: const EdgeInsets.all(27),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 26),
                  child: const Text("Results",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.w100))),
              Container(
                margin: const EdgeInsets.only(top: 46),
                child: GradientButton(
                    height: 47,
                    borderRadius: BorderRadius.circular(63),
                    onPressed: () {
                      context
                          .read<GlobalKey<NavigatorState>>()
                          .currentState!
                          .pop(context);
                    },
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Try again",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: GradientButton(
                    height: 47,
                    borderRadius: BorderRadius.circular(63),
                    onPressed: () {
                      context
                          .read<GlobalKey<NavigatorState>>()
                          .currentState!
                          .pop(context);
                    },
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Go to menu",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              )
            ])));
  }
}
