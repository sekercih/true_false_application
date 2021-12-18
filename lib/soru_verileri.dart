import 'package:true_false_application/soru.dart';

class SoruVeri {
  int _soruIndex = 0;
  // ignore: prefer_final_fields
  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: "Dünyanın En Uzun Nehrinin Adı Amazondur.",
        soruCevaplar: false),
    Soru(
        soruMetni:
            "Mustafa Kemal Atatürk’ün Nüfusa Kayıtlı Olduğu İl Gaziantep'dir.",
        soruCevaplar: true),
    Soru(soruMetni: "Kanada'nın başkenti Torinyo'dur.", soruCevaplar: false),
    Soru(
        soruMetni: "Üç Büyük Dince Kutsal Sayılan Şehir Kudüs'tür.",
        soruCevaplar: true),
    Soru(soruMetni: "5 Yılda Bir Şubat Ayı 29 Çeker.", soruCevaplar: false),
    Soru(
        soruMetni: "Ankara İlimizin Araba ve Şehir Kod Numarası 07 dir.",
        soruCevaplar: false),
    Soru(
        soruMetni:
            "Bir Sebepten Dolayı Tek Kulağına Küpe Takan Osmanlı Padişahı Yavuz Sultan Selim'dir.",
        soruCevaplar: true),
    Soru(soruMetni: "Aspirinin Hammaddesi Köknardır.", soruCevaplar: false),
    Soru(
        soruMetni: "Dünya Sağlık Örgütünün Kısaltılmış Who'dur.",
        soruCevaplar: true)
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruCevaplar() {
    return _soruBankasi[_soruIndex].soruCevaplar;
  }

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool testEnd() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testRest() {
    _soruIndex = 0;
  }
}
