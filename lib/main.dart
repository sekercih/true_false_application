import 'package:flutter/material.dart';

import 'package:true_false_application/soru_verileri.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.orange[400],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> karar = [];

  SoruVeri test_1 = SoruVeri();
  void butonFonksiyon(bool secilenButton) {
    if (test_1.testEnd() == true) {
      //alertt diolog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("TEBRİKLER TESTİ BİTİRDİNİZ."),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text("BAŞLANGICA DÖNÜN"),
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    karar = [];
                    test_1.testRest();
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
          test_1.getSoruCevaplar() == secilenButton
              ? karar.add(dogruIcon)
              : karar.add(yanlisIcon);
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
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
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
                      child: Icon(
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
                      child: Icon(
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
