// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glover_t7_v2/u.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.tColor2,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/profile2.svg',height: 60,),
                const SizedBox(width: 10),
                Text(
                  'Profile',
                  style: AppFonts.quicksand(size: 30),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.tColor3,
                      borderRadius: BorderRadius.circular(20)),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 50),
                    child:  const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://cdn.leonardo.ai/users/99ab3860-c455-4446-8e99-3d321dc98ab0/generations/cb424f0c-e32d-4211-896e-8bb76342cb2b/Default_Eine_farb_explosion_die_ganz_bund_ist_und_wo_ein_lwe_d_3.jpg?w=512'),
                          radius: 50,
                        ))),
              ],
            ),
          ),
           Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Liam Johnson",
                style: AppFonts.quicksand(
                    
                    color: AppColors.textColor,size: 20),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                ListTile(
                  title: Text(
                    "Name",
                    style: AppFonts.quicksand(color: AppColors.tColor2,size: 15),
                  ),
                  subtitle: Text(
                    "Liam Johnson",
                    style: AppFonts.quicksand(color: Colors.white,size: 18),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text(
                    "Where do you work",
                    style: AppFonts.quicksand(color: AppColors.tColor2,size: 15),
                  ),
                  subtitle: Text(
                    "Empresa glover_t7_v2",
                    style: AppFonts.quicksand(color: Colors.white,size: 18),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text(
                    "Age",
                    style: AppFonts.quicksand(color: AppColors.tColor2,size: 15),
                  ),
                  subtitle: Text(
                    "21",
                    style: AppFonts.quicksand(color: Colors.white,size: 18),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text(
                    "Description",
                    style: AppFonts.quicksand(color: AppColors.tColor2,size: 15),
                  ),
                  subtitle: Text(
                    "I love power games",
                    style: AppFonts.quicksand(color: Colors.white,size: 18),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                color: AppColors.tColor3,),
              height: 40,
              width: 150,
            
              child: Center(
                child: Text("BIO",
                    style: AppFonts.quicksand(color: AppColors.textColor,size: 15)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
