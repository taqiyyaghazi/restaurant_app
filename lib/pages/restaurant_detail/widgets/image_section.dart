import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String pictureId;

  const ImageSection({super.key, required this.pictureId});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pictureId,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Image.network(
          pictureId,
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
