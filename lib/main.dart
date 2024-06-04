import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BROWSE CATEGORIES',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not sure exactly which recipe you are looking for? Do a search or dive into our most popular categories',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            // Row 1: Center-aligned text


            // Row 2: Left-aligned text


            // Row 3: Images with text in the middle
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'By Meat',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildImageStack('Beef', 'images/beef.jpg', circleShape: true),
                      buildImageStack('Chicken', 'images/chicken.jpg', circleShape: true),
                      buildImageStack('Pork', 'images/pork.jpg', circleShape: true),
                      buildImageStack('Seafood', 'images/seafood.jpg', circleShape: true),
                    ],
                  ),
                ],
              ),
            ),

            // Row 4: Images with text at the bottom center
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'By Course',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildImageStack('Main dishes', 'images/maindishes.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Salad Recipes', 'images/saladrecipes.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Side Dishes', 'images/sidedishes.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Crockpot', 'images/crock.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                    ],
                  ),
                ],
              ),
            ),

            // Row 5: Images with text at the bottom center
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'By Dessert',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildImageStack('Ice cream', 'images/ice.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Brownie', 'images/brownie.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Pies', 'images/pies.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                      buildImageStack('Cookies', 'images/cookies.jpg', textAlignment: Alignment.bottomCenter, circleShape: true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build image stack with text in the middle or at the bottom center
  Widget buildImageStack(String text, String imagePath, {Alignment textAlignment = Alignment.center, bool circleShape = false}) {
    return Stack(
      alignment: textAlignment,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black54,
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
