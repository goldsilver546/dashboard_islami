import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Membuat sebuah controler untuk menambahkan titik titik
  final MoneyMaskedTextController myController = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0
  );

  // Membuat variable awal untuk total harta dan zakat
  double totalharta = 0;

  double zakatdikeluarkan = 0;

  double minimumharta = 85000000;

  // Membuat variable untuk menampung format dari variable awal
  String formattedharta = "";

  String formattedZakatDikeluarkan = "";

  // Membuat function untuk menghitung zakat
  void hitungZakat(){
    // Ambil inputan dari controller dan hilangkan titik
    String cleanValue = myController.text.replaceAll(".", "");
    // parsing dari string ke double
    double inputValue = double.tryParse(cleanValue) ?? 0;
    // Membuat sebuah pengkondisian jika harta kita sama atau lebih dari minimalharta
    if(inputValue >= minimumharta){
      // Jika inputan lebih dari minimumharta kita akan ubah valuenya
      setState(() {
        totalharta = inputValue;
        zakatdikeluarkan = (inputValue * 2.5) / 100;
        // Kita ubah menjadi format rupiah
        formattedharta = NumberFormat.currency(locale: 'id_ID', symbol: '').format(totalharta);
        formattedZakatDikeluarkan = NumberFormat.currency(locale: 'id_ID', symbol: '').format(zakatdikeluarkan);
      });
    } else {
      // Jika harta kurang dari 85 juta maka munculkan dialog
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("peringatan"),
          content: Text("harta anda tidak mencapai 85 juta"),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget CardHarta (){
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Data",
              style: TextStyle(
                fontFamily: "PoppinsMedium",
                color: ColorApp.primary
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorApp.primary)
                ),
                label: Text("Masukkan Total Harta"),
                labelStyle: TextStyle(color: ColorApp.text),
                prefix: Text("Rp. "),
                fillColor: ColorApp.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 8),
                padding: EdgeInsets.all(16),
              ),
              onPressed: (){
                hitungZakat();
              }, 
              child: Text(
                "OK", 
                style: TextStyle(
                  color: ColorApp.white
                ),
              )
            ),
          ],
        ),
      );
    }
    Widget CardResult (){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red[300]!,
            ),
            child: Column(
              children: [
                Text(
                  "Total Uang",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Rp. ${formattedharta}",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ]
            ),
          ),
          SizedBox(width: 20,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple[300]!,
            ),
            child: Column(
              children: [
                Text(
                  "Zakat dikeluarkan",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Rp. ${formattedZakatDikeluarkan}",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Kalkulator Zakat",
          style: TextStyle(
            color: ColorApp.white,
            fontFamily: "PoppinsMedium"
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorApp.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}