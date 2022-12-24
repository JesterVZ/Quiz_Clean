import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget{
  String? text;
  Header({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 26,
        child: Stack(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    Provider.of<GlobalKey<NavigatorState>>(context, listen: false).currentState!.pop(context);

                  },
                  child: SvgPicture.asset("asstes/back.svg"),
                ),
              ),
            ),
            Center(child: Text(text ?? "", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}