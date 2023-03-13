import 'dart:math';

import 'package:flutter/material.dart';

class CardScrollWidget extends StatelessWidget {
  final List<ImageModel> imageModelList;
  var currentPage;

  CardScrollWidget(this.currentPage, this.imageModelList);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ScrollCardSizes().widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var widthOfPrimaryCard =
            (((contraints.maxHeight) - 2 * ScrollCardSizes().padding)) *
                ScrollCardSizes().cardAspectRatio;
        var primaryCardLeft =
            ((contraints.maxWidth) - 2 * ScrollCardSizes().padding) -
                widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < imageModelList.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = ScrollCardSizes().padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: ScrollCardSizes().padding +
                ScrollCardSizes().verticalInset * max(-delta, 0.0),
            bottom: ScrollCardSizes().padding +
                ScrollCardSizes().verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: ScrollCardSizes().cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(imageModelList[i].image, fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(imageModelList[i].title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Look At")),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

class ImageModel {
  String image;
  String title;

  ImageModel(this.image, this.title);
}

class ScrollCardSizes {
  final double padding = 20.0;
  final double verticalInset = 20.0;
  final double cardAspectRatio = 12.0 / 16.0;
  final double widgetAspectRatio = (12.0 / 16.0) * 1.2;
}
