import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home/widgets/app_bar_home.dart';
import 'package:restaurant_app/pages/home/widgets/restaurant_list_section.dart';
import 'package:restaurant_app/pages/home/widgets/search_bar_section.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface),
          child: ListView(
            children: const [
              SearchBarSection(),
              SizedBox(
                height: 16,
              ),
              RestaurantListSection()
            ],
          )),
    );
  }
}
