// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:glover_t7_v2/pages/disliked_page.dart';
import 'package:glover_t7_v2/pages/liked_page.dart';
import 'package:glover_t7_v2/pages/profile_page.dart';
import 'package:glover_t7_v2/pages/games_page.dart';
import 'package:glover_t7_v2/u.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pc,
        children: [
          GamesPage(),
          ProfilePage(),
          // LikedPage(),
          // DislikedPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: AppColors.tColor2,
  currentIndex: paginaAtual,
  
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.videogame_asset_sharp),
      label: 'Games',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
    //  BottomNavigationBarItem(
    //   icon: Icon(Icons.favorite),
    //   label: 'Liked',
    // ),
    //  BottomNavigationBarItem(
    //   icon: Icon(Icons.do_disturb),
    //   label: 'DisLiked',
    // ),
  ],
  onTap: (pagina) {
    pc.animateToPage(
      pagina,
      duration: Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  },
  // Chỉnh font chữ ở đây
  selectedLabelStyle: AppFonts.quicksand(size: 20,color: AppColors.textColor),
  unselectedLabelStyle: AppFonts.quicksand(),
),

    );
  }
}
