import 'package:flutter/material.dart';
import 'package:glover_t7_v2/models/game.dart';
import 'package:glover_t7_v2/u.dart';

class DislikedPage extends StatelessWidget {
  final List<Game> dislikedItems;

  const DislikedPage({Key? key, required this.dislikedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text(
      'Disliked Items',
      style: AppFonts.quicksand(size: 20, color: AppColors.tColor4),
    ),
  ),
  body: dislikedItems.isNotEmpty
      ? ListView.builder(
          itemCount: dislikedItems.length,
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
                                image: AssetImage(dislikedItems[index].image),
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
                                    dislikedItems[index].name,
                                    style: AppFonts.quicksand(size: 23),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: dislikedItems[index].genre.map((item) {
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
                                    dislikedItems[index].description,
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
  }
}