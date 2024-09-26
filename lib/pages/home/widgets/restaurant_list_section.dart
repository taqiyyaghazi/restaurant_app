import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';

class RestaurantListSection extends StatelessWidget {
  const RestaurantListSection({super.key});

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restaurants =
            parseRestaurants(snapshot.data).restaurants;
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Daftar Restaurant',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Temukan restaurant rekomendasi buat kamu',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: restaurants.map((restaurant) {
                    return _buildRestaurantItem(context, restaurant);
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        key: Key(restaurant.id),
        contentPadding: const EdgeInsets.symmetric(vertical: 2),
        leading: Hero(
            tag: restaurant.pictureId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                restaurant.pictureId,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            )),
        title: Text(
          restaurant.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              size: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              restaurant.city,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 16,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              restaurant.rating.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
