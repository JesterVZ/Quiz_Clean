import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';

import '../../widgets/UI/gradient_button.dart';

class HomeTab extends StatefulWidget{
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab>{
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: EdgeInsets.only(right: 42, top: 42),
                    child: Image.asset("asstes/coins.png")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                        child: const Text("Super quiz", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                        child: const Text("Play super quiz", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),)
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context)!.size.width,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(33),
                    topRight: Radius.circular(33),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 46),
                      child: GradientButton(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0185FF), Color(0xFF6324CA)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft
                      ),
                      height: 47,
                      borderRadius: BorderRadius.circular(63),
                      onPressed: (){},
                      width: MediaQuery.of(context)!.size.width,
                      child: const Text("Play quiz now", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
                    )
                  ],),
                ),
              )

        ]));

  }
}