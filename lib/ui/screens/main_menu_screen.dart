import 'package:e_group_x/data/models/globals.dart';
import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/widgets/zaka_button.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Zaka_logo.png"),
              Text("Hello, ${Globals.instance.account.firstName}!", style: TextStyle(
                fontSize: 40,
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),),
              Text('What would you like to do today?', style: TextStyle(
                color: Colors.black54,
                fontSize: 20
              ),),

              ZakaButton(buttonText: "Make A Transfer", onPressed: (){
                Navigator.pushNamed(context, bankTransferScreen);
              }),
              ZakaButton(buttonText: "View your Details", onPressed: (){
                Navigator.pushNamed(context, viewDetailsScreen);
              }),
              ZakaButton(buttonText: "Logout", onPressed: (){
                Navigator.pushNamedAndRemoveUntil(
                    context, loginScreen, (Route<dynamic> route) => false);
              }),

            ],
          ),
        ),
      ),
    );
  }
}
