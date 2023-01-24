import 'package:flutter/material.dart';
import 'package:ready_widgets/widgets/cards/scroll_card.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  List<ImageModel> imageModelList = <ImageModel>[];
  late PageController controller;
  var currentPage = 4 - 1.0;
  List<String> images = [
    "assets/images/image_04.jpg",
    "assets/images/image_03.jpg",
    "assets/images/image_02.jpg",
    "assets/images/image_01.png",
  ];

  List<String> title = [
    "Hounted Ground",
    "Fallen In Love",
    "The Dreaming Moon",
    "Jack the Persian and the Black Castel",
  ];
  @override
  Widget build(BuildContext context) {
    imageModelList.add(ImageModel(images[0], title[0]));
    imageModelList.add(ImageModel(images[1], title[1]));
    imageModelList.add(ImageModel(images[2], title[2]));
    imageModelList.add(ImageModel(images[3], title[3]));
    controller = PageController(initialPage: imageModelList.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: <Widget>[
              CardScrollWidget(currentPage, imageModelList),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: controller,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
