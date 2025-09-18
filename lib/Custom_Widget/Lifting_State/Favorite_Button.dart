import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback isToggleFavorite;

  const FavoriteButton(
      {super.key,
        required this.isToggleFavorite,
        required this.isFavorite
      });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: isToggleFavorite,
        icon: isFavorite
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border_outlined));
  }
}
