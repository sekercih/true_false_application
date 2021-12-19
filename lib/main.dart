import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:true_false_application/services/karar_servis.dart';
import 'package:true_false_application/widgets/center_icon.dart';
import 'package:true_false_application/widgets/siralama_yap.dart';

import 'package:true_false_application/soru_verileri.dart';
import 'package:true_false_application/widgets/sonuc.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: SiralamaYap(),
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _padding),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Icon> karar = [];
  int dogruSayisi = 0;
  int yanlisSayisi = 0;

  SoruVeri test_1 = SoruVeri();
  void butonFonksiyon(bool secilenButton) {
    if (test_1.testEnd() == true) {
      //alertt diolog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Column(
              children: [
                const Text("TEBRİKLER TESTİ BİTİRDİNİZ."),
                const SizedBox(height: 10),
                Sonuc(
                    fontSize: 20.0,
                    dogruSayisi: dogruSayisi,
                    yanlisSayisi: yanlisSayisi)
              ],
            ),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text("BAŞLANGICA DÖNÜN"),
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    karar = [];
                    test_1.testRest();
                    dogruSayisi = 0;
                    yanlisSayisi = 0;
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(
        () {
          double size = karar.length > 6 ? 40.0 : 60.0;
          bool isTrue = test_1.getSoruCevaplar() == secilenButton;
          Icon resultIcon = KararServis.setIcon(size, isTrue);
          karar = KararServis.setIconList(karar, karar.length);
          karar.add(resultIcon);
          // test_1.getSoruCevaplar() == secilenButton
          //     ? karar.add(dogruIcon)
          //     : karar.add(yanlisIcon);
          dogruSayisi = isTrue ? ++dogruSayisi : dogruSayisi;
          yanlisSayisi = isTrue ? yanlisSayisi : ++yanlisSayisi;
          test_1.sonrakiSoru();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const CenterIcon(),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        if (karar.isNotEmpty)
          Expanded(
              flex: 2,
              child: Sonuc(
                  fontSize: 25.0,
                  dogruSayisi: dogruSayisi,
                  yanlisSayisi: yanlisSayisi)),
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 3,
            runSpacing: 3,
            children: karar,
          ),
        ),
        /*Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15), primary: Colors.red),
                  child: Icon(Icons.restart_alt_rounded),
                  onPressed: () {
                    setState(() {
                      sorular.remove;
                      karar.remove;
                      sorular[soruIndex] = sorular[0];
                      karar[soruIndex] = karar[0];
                      print(sorular[0]);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
       */
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      //padding: EdgeInsets.all(12),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          primary: Colors.redAccent),
                      child: const Icon(
                        Icons.thumb_down,
                        size: 60.0,
                      ),
                      onPressed: () {
                        butonFonksiyon(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, padding: EdgeInsets.all(10)),
                      child: const Icon(
                        Icons.thumb_up,
                        size: 60.0,
                      ),
                      onPressed: () {
                        butonFonksiyon(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
