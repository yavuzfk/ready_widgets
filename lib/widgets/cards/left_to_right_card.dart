import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  final ImageCardModel imageModel;
  const Favourites({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageModel.image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 10,
                top: 170,
                bottom: 15,
                child: Text(
                  imageModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class ImageCardModel {
  String image;
  String title;

  ImageCardModel(this.image, this.title);
}
