import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/current_balance.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/main_body.dart';
import 'package:flutter/material.dart';

class home_body extends StatelessWidget {
  const home_body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            //alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                height: 80,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.indigo,
              ),

              //home body
              Container(margin: EdgeInsets.only(top: 60), child: main_body()),

              //current balance
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CurrentBalance(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
