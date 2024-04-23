import 'package:flutter/material.dart';
import 'package:glover_t7_v2/pages/home_page.dart';
import 'package:glover_t7_v2/pages/login_page.dart';
import 'package:glover_t7_v2/u.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/login', // Đặt tên cho trang login
      // routes: {
      //   '/login': (context) => HomePage(),
      //   // Các routes khác ở đây...
      // },
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tColor4),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
