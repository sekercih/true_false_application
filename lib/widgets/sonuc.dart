import 'package:flutter/material.dart';

class Sonuc extends StatelessWidget {
  Sonuc(
      {Key? key,
      required this.dogruSayisi,
      required this.yanlisSayisi,
      required this.fontSize})
      : super(key: key);
  int dogruSayisi;
  int yanlisSayisi;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Doğru Sayisi: $dogruSayisi Yanlış Sayisi: $yanlisSayisi",
      style: TextStyle(fontSize: fontSize),
    ));
  }
}
