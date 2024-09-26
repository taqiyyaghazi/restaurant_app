import 'package:flutter/material.dart';
import 'package:restaurant_app/common/theme.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/pages/home/home_page.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant Apps',
        debugShowCheckedModeBanner: false,
        theme: MaterialTheme(Theme.of(context).textTheme).light(),
        darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
                restaurant:
                    ModalRoute.of(context)?.settings.arguments as Restaurant,
              ),
        });
  }
}
