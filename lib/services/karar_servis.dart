import 'package:flutter/material.dart';

class KararServis {
  static Icon setIcon(double size, bool isTrue) {
    return Icon(
      isTrue ? Icons.mood : Icons.mood_bad,
      color: isTrue ? Colors.green : Colors.red,
      size: size,
    );
  }

  static List<Icon> setIconList(List<Icon> icons, int size) {
    if (size > 6) {
      for (var i = 0; i < icons.length; i++) {
        icons[i] = icons[i].color == Colors.green
            ? setIcon(40, true)
            : setIcon(40, false);
      }
    }
    return icons;
  }
}
