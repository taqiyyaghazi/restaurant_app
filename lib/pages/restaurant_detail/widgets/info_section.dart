import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class InfoSection extends StatelessWidget {
  final Restaurant restaurant;

  const InfoSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          Row(
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
              const SizedBox(
                width: 8,
              ),
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
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            restaurant.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          )
        ],
      ),
    );
  }
}
