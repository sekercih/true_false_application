import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CenterIcon extends StatelessWidget {
  const CenterIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FaIcon(
        FontAwesomeIcons.userFriends,
        size: 100,
      ),
    );
  }
}
