import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerItemWidget extends StatelessWidget {
  String itemTitle;
  String route;
  Icon icon;

  // ignore: use_key_in_widget_constructors
  DrawerItemWidget(this.itemTitle, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      leading: icon,
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.orangeAccent,
      ),
      title: Text(itemTitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.orangeAccent,
          )),
    );
  }
}
