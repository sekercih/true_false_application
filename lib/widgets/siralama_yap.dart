import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SiralamaYap extends StatelessWidget implements PreferredSizeWidget {
  const SiralamaYap({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("Bilgi Yarışması"),
      centerTitle: true,
      leading: const Center(
        child: FaIcon(
          FontAwesomeIcons.arrowAltCircleLeft,
        ),
      ),
      actions: const [
        Icon(
          Icons.search,
          size: 30,
        ),
        Icon(
          Icons.person,
          size: 30,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
