import 'package:flutter/material.dart';

class MyDrawerHomePageWidget extends StatelessWidget {
  const MyDrawerHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(colors: [Colors.yellow, Colors.blue])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // Image.asset('assets/kaioken.gif'),
          //Permet d'inserer une image avec NetworkImage et AssetImage
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/kaioken.gif"),
          ),
        ],
      ),
    );
  }
}
