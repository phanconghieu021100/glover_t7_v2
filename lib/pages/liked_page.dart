// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:glover_t7_v2/models/game.dart';
import 'package:glover_t7_v2/u.dart';

class LikedPage extends StatelessWidget {
  final List<Game> likedItems;

  const LikedPage({Key? key, required this.likedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text(
      'Liked Items',
      style: AppFonts.quicksand(size: 20, color: AppColors.tColor4),
    ),
  ),
  body: likedItems.isNotEmpty
      ? ListView.builder(
          itemCount: likedItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10 ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Image(
                                image: AssetImage(likedItems[index].image),
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              // Sử dụng Expanded để giới hạn chiều rộng của Column
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    likedItems[index].name,
                                    style: AppFonts.quicksand(size: 23),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: likedItems[index].genre.map((item) {
                                      return Text(
                                        '${item}, ',
                                        style: AppFonts.quicksand(
                                          size: 13,
                                          weight: FontWeight.w700,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(height: 10),

                                  // Khoảng cách giữa name và description
                                  Text(
                                    likedItems[index].description,
                                    style: AppFonts.quicksand(
                                      size: 15,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Khoảng cách giữa các item
                ],
              ),
            );
          },
        )
      : Center(child: Text("Don't have Item")),
);
;
  }
}
