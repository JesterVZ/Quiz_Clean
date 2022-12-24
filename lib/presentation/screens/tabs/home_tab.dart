import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';

import '../../../base/colors.dart';
import '../../../base/routes.dart';
import '../../widgets/UI/gradient_button.dart';
import '../../widgets/UI/timer.dart';

class HomeTab extends StatefulWidget{
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab>{
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: EdgeInsets.only(right: 42, top: 22),
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
                ]),
            Positioned(
              bottom: 0,
                child: Container(
              width: MediaQuery.of(context).size.width,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 9, bottom: 14),
                        child: Text("The quiz ends in", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100, color: unselectedColor))),
                    Row(
                      children: [
                        TimerBlock(time: "7", part: "hours"),
                        const Spacer(),
                        TimerBlock(time: "30", part: "minutes"),
                        const Spacer(),
                        TimerBlock(time: "30", part: "seconts"),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 46),
                      child: GradientButton(
                          height: 47,
                          borderRadius: BorderRadius.circular(63),
                          onPressed: (){
                            Provider.of<GlobalKey<NavigatorState>>(context, listen: false).currentState!.pushNamed(routeQuiz);
                          },
                          width: MediaQuery.of(context).size.width,
                          child: const Text("Play quiz now", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
                    )
                  ],),
              ),
            ))

          ],
        )
        );

  }
}