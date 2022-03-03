import 'package:flutter/material.dart';
import 'package:foxhound/global/global.parameter.dart';
import 'package:foxhound/widget/drawer/drawer.header.widget.dart';
import 'package:foxhound/widget/drawer/drawer.item.widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const MyDrawerHeaderWidget(),
          // Ici on va faire une boucle pour afficher la liste des Items
          // On appel la classe GlobalParameter puis la variable menu et
          // pour faire une boucle on utilise map (C'est come For Each)
          // Map est une fonctione dans laquelle je prend item
          // Pour copier un tableau en java script ou dart il faut utiliser (...)
          // Le item correspon à un objet
          // Exemple l'objet {"title": "Home", "route": "/", "icon": Icon(Icons.home)},
          // On met item['title'] car on n'a pas déclaré les types ex {"title": "Home",
          ...(GlobalParameters.menus).map((item) => DrawerItemWidget(
              item['title'] as String,
              item['route'] as String,
              item['icon'] as Icon))
        ],
      ),
    );
  }
}
