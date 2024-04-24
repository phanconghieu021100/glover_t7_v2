// ignore_for_file: prefer_const_constructors, avoid_print, prefer_final_fields, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glover_t7_v2/models/game.dart';
import 'package:glover_t7_v2/pages/disliked_page.dart';
import 'package:glover_t7_v2/pages/liked_page.dart';
import 'package:glover_t7_v2/u.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';


class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {

 late MatchEngine _matchEngine;
 List<SwipeItem> _swipeItems = <SwipeItem>[];
 int currentPicture = 0;
 int numberPictures = 2;

  List<Game> items = [
     Game(
        name: "Castleho", 
        release: 2017, 
        description: "Castleho Castle, an ancient symbol with imponent architecture, welcomes visitors from all over, creating a vibrant and bustling atmosphere.", 
        genre: ["Action", "Adventure", "Indie"], 
        image: "assets/i11.jpeg"
        ),
        Game(
        name: "Photno", 
        release: 2017, 
        description: "Hollow Knight is a 2017 action-adventure game developed and published by Team Cherry, and was released for Microsoft Windows, macOS, and Linux in 2017, and later for the Nintendo Switch, PlayStation 4, and Xbox One in 2018.", 
        genre: ["Action", "Adventure", "Indie"], 
        image: "assets/pgo.jpeg"
        ),
      Game(
        name: "Moutain Everest", 
        release: 2017, 
        description: "The world's highest peak, located in the Himalayas, Mount Everest is a challenge for climbers and a symbol of extraordinary strength and spirit.", 
        genre: ["Action", "Adventure", "Indie"], 
        image: "assets/montEverest.webp"
        ),
      Game(
        name: "Mansion", 
        release: 2018, 
        description: "Ancient Mansion, a historical villa with dark beauty, rough lime walls, old windows and no trace of modern life.",
        genre: ["Adventure", "Indie"], 
        image: "assets/mansion.webp"
        ),
      Game(
        name: "Cute Dog", 
        release: 2018, 
        description: "The cute dog is happy, swinging and running in the middle of a large flower garden. Around, colorful flowers create a dreamy scene, blending with the dog's joy.",
        genre: ["Platform", "Indie"], 
        image: "assets/dog.webp"
        ),
      Game(
        name: "Interiorun", 
        release: 2019, 
        description: "An Interiorun villa located near the beach, a place worth living with modern architecture, spacious, airy and fully equipped, including a large swimming pool and lounge chairs for sunbathing", 
        genre: ["Action", "Adventure", "Indie"], 
        image: "assets/interior.webp"
        ),
  ];

  List<Game> likedItems = [];
List<Game> dislikedItems = [];

  @override
  void initState() {
    for (int i = 0; i < items.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Game(name: items[i].name, release: items[i].release, description: items[i].description, genre: items[i].genre, image: items[i].image),
          likeAction: () {
            setState(() {
              likedItems.add(items[i]);
              print(likedItems);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${items[i].name}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
                setState(() {
              dislikedItems.add(items[i]);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("You didn't like it ${items[i].name}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tColor3,
      appBar: AppBar(
        backgroundColor: AppColors.tColor2,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,  
            children: [
               Icon(
                Icons.videogame_asset_outlined,
                color: Colors.purple.shade300,
              ),
              const SizedBox(width: 10),
              Text(
                'Gamelovers',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.purple.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )
                ),
              ),
              ElevatedButton(onPressed: (){Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LikedPage(likedItems: likedItems),
  ),
);}, child: Icon(Icons.favorite)),
ElevatedButton(onPressed: (){Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DislikedPage(dislikedItems:dislikedItems),
  ),
);}, child: Icon(Icons.do_disturb))
            ]
          ),
        )
      ),
      body: SwipeCards(
        matchEngine: _matchEngine, 
        onStackFinished: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No more games to enjoy!'), 
            duration: Duration(milliseconds: 500),
          )
          );
        }, 
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: "imageTag$i", 
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(items[i].image),
                        )
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black,
                            Colors.transparent
                          ]
                        )
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentPicture != 0) {
                                setState(() {
                                  currentPicture = currentPicture - 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentPicture < (numberPictures - 1)) {
                                setState(() {
                                  currentPicture = currentPicture + 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 6,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: numberPictures,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int i) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                  width: ((MediaQuery.of(context).size.width - (20 + ((numberPictures + 1) * 8))) / numberPictures),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 0.5
                                    ),
                                    color: currentPicture == i ? Colors.white : Colors.grey
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      items[i].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {

                                  }, 
                                  icon: const Icon(Icons.info, color: Colors.white,),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _matchEngine.currentItem?.nope();
                                  },
                                  splashColor: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.red.shade200,
                                      )
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Image(image: AssetImage("assets/dislike2.png"),color: AppColors.tColor2,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _matchEngine.currentItem?.like();
                                  },
                                  splashColor: Colors.lightGreenAccent,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                      )
                                    ),
                                    child:  Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Image(image: AssetImage("assets/like2.png"),color: Colors.red.shade200,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ), 
            ),
          );
        },
        likeTag: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green)
          ),
          child: const Text('Like'),
        ),
        nopeTag: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red)
          ),
          child: const Text('Nah'),
        ),        
      ),
   ); 
  }
}
