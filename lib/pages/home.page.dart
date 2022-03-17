import 'package:flutter/material.dart';
import 'package:foxhound/widget/drawer/drawer.homepage.widget.dart';
import 'package:foxhound/widget/drawer/drawer.homepage2.widget.dart';
import 'package:foxhound/widget/drawer/drawer.homepage3.widget.dart';
import 'package:foxhound/widget/drawer/drawer.homepage4.widget.dart';
import 'package:foxhound/widget/drawer/mydrawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // le Menu en haut à gauche
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Accueil"),
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            //CarouselDemo(),
            MyDrawerHomePageWidget(),
            MyDrawerHomePageWidget2(),
            MyDrawerHomePageWidget3(),
            MyDrawerHomePageWidget4(),
            //Text("BIENVENUE", style: Theme.of(context).textTheme.bodyText1),
            // ignore: deprecated_member_use
          ],
        ),
      ),
    );
  }
}
