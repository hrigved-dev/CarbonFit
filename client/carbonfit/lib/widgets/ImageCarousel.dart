import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fixyourprint/data/ImageCarousel.dart';
import 'package:fixyourprint/models/ImageCarouselModel.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<ImageCarouselModel> data = [];

  @override
  void initState() {
    super.initState();
    data = ImageCarouselData().getImageCarouselData();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = data
        .map((item) => Container(
              child: Container(
                width: 500,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: item.imgUrl,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Center(
                            child: Text(
                              item.quote,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
