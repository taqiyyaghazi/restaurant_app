import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBar(
            hintText: 'Cari Restoran',
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
            leading: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            textStyle: WidgetStatePropertyAll(
                TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            elevation: const WidgetStatePropertyAll(0),
          ),
          // _buildList(context),
        ],
      ),
    );
  }
}
