import 'package:flutter/material.dart';

import '../models/food.dart';
import '../models/restaurant.dart';
import '../widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                  height: 240.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.restaurant.imageUrl)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor,
                    iconSize: 30.0,
                    onPressed: () => print("Added to Favorites 💓"),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              widget.restaurant.name,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            RatingStars(widget.restaurant.rating),
            const SizedBox(height: 6.0),
            Text(
              widget.restaurant.address,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
          ]),
        ]),
        const SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FlatButton(
              onPressed: () {
                print("Add a review 📝");
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Text('Reviews 🖋️',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400))),
          FlatButton(
              onPressed: () {
                print("Reach out to this restaurant 📲");
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Text('Contact 📞',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400))),
        ]),
        const SizedBox(height: 20.0),
        Center(
          child: Text(
            'Menu',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2),
          ),
        ),
        const SizedBox(height: 22.0),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(10.0),
            children: List.generate(widget.restaurant.menu.length, (index) {
              Food food = widget.restaurant.menu[index];
              return _buildRestaurantMenuItem(food);
            }),
          ),
        )
      ]),
    );
  }

  Widget _buildRestaurantMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.5),
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.5,
                    0.7
                  ]),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$ ${menuItem.price}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0)),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30.0,
                  ),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
