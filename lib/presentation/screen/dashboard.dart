import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_header_dashboard_morning.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorApp.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Assalamu'alaikum Fauzan",
                  style: TextStyle(
                    fontFamily: "PoppinsRegular"
                  ),  
                ),
              ),
            ),
            SizedBox(height: 16,),
            Text(
              "Subuh", 
              style: TextStyle(
                fontFamily: "PoppinsMedium",
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "04:48",
              style: TextStyle(
                fontFamily: "PoppinsBold",
                fontSize: 28,
              ),
            ),
            SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ColorApp.red,
                  size: 16,
                ),
                SizedBox(width: 4,),
                Text(
                  "Berjo, Karanganyar",
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    Widget CardMenus(){
      return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorApp.primary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [ 
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/doa');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_doa.png",),
                    Text(
                      "Doa-doa",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/zakat');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_zakat.png",),
                    Text(
                      "Zakat",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/jadwal_sholat');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_jadwal_sholat.png",),
                    Text(
                      "Jadwal Sholat",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/video-kajian');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_video_kajian.png",),
                    Text(
                      "Video Kajian",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    Widget Inspiration(){
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Inspirasi",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "PoppinsSemiBold",
                ),
              ),
            ),
            Image.asset(
              "assets/images/img_inspiration.png", 
              fit: BoxFit.cover
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_3.jpeg", 
              fit: BoxFit.cover
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_4.jpeg", 
              fit: BoxFit.cover
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_5.jpeg", 
              fit: BoxFit.cover
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_6.jpeg", 
              fit: BoxFit.cover
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: ListView(
        children: [
          Header(),
          CardMenus(),
          Inspiration()
        ],
      ),
    );
  }
}
