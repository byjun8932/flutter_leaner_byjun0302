import 'package:flutter/material.dart';
import '../model/idol.dart';

class InfoCard extends StatelessWidget {
  final Idol idol;
  final bool isFavorite;
  final void Function(Idol idol)? onPressedFavoritePressed;

  const InfoCard({
    super.key,
    required this.idol,
    required this.isFavorite,
    this.onPressedFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _image(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _second(),
        ),
        _third(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _fourth(),
        ),
      ],
    );
  }

  Widget _image() {
    return AspectRatio(
      aspectRatio: 9 / 8,
      child: Image.network(
        idol.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _second() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              idol.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(idol.subTitle),
          ],
        ),
        Spacer(), // ignore: prefer_const_constructors
        GestureDetector(
          onTap: () => onPressedFavoritePressed?.call(idol),
          child: Row(
            children: [
              Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red,
              ),
              const Text('34'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _third() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              'CALL',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.send,
              color: Colors.blue,
            ),
            Text(
              'ROUTE',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.share,
              color: Colors.blue,
            ),
            Text(
              'SHARE',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _fourth() {
    return Text(
      idol.description,
      maxLines: 8,
      overflow: TextOverflow.ellipsis,
    );
  }
}
