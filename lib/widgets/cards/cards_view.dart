import 'package:flutter/material.dart';
import 'package:ready_widgets/widgets/cards/left_to_right_card.dart';
import 'package:ready_widgets/widgets/cards/scroll_card.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  List<ImageModel> imageModelList = <ImageModel>[];
  List<ImageCardModel> favouriteImageList = <ImageCardModel>[];
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

    favouriteImageList
        .add(ImageCardModel("assets/images/image_02.jpg", "The Dreaming Moon"));
    favouriteImageList
        .add(ImageCardModel("assets/images/image_03.jpg", "Full In Love"));
    favouriteImageList
        .add(ImageCardModel("assets/images/image_04.jpg", "Hoop Jeeee"));

    controller = PageController(initialPage: imageModelList.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favouriteImageList.length,
                        itemBuilder: (context, index) {
                          return Favourites(
                              imageModel: favouriteImageList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
