import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  const MyDrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: const BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [Colors.blueAccent, Colors.red])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //Permet d'inserer une image avec NetworkImage et AssetImage
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://c4.wallpaperflare.com/wallpaper/609/691/724/metal-gear-rising-revengeance-metal-gear-solid-fox-video-games-wallpaper-preview.jpg"),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://mcdn.wallpapersafari.com/medium/89/30/3fjzro.jpg"),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage("https://wallpapercave.com/wp/6ZPiFdB.jpg"),
            ),
          ],
        ));
  }
}
