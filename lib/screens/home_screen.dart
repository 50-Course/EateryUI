import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/restaurant.dart';
import '../widgets/rating_stars.dart';
import '../widgets/recent_orders.dart';
import 'cart_screen.dart';
import 'restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double iconSize = 30.0;

  _builRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            border: Border.all(
                width: 1.0, color: Color.fromARGB(255, 238, 238, 238)),
          ),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      restaurant.name,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 4.0),
                    RatingStars(restaurant.rating),
                    const SizedBox(height: 4.0),
                    Text(restaurant.address,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis)),
                  ]),
            ),
          ]),
        ),
      ));
    });
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KellarEats 👩‍🍳",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle, size: iconSize),
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
            child: Text(
              "Cart 🛒",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: 'Search 👀',
              prefixIcon: const Icon(Icons.search, size: 30.0),
              suffixIcon: const Icon(Icons.clear, size: 30.0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        RecentOrders(),
        const SizedBox(height: 4.0),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Restaurants Near You',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2)),
          ),
          _builRestaurants(),
        ]),
      ]),
    );
  }
}
