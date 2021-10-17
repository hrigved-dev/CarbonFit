import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://static.scientificamerican.com/sciam/cache/file/8B6B0B7A-351F-4CDF-97DFED59CF5305E8_source.jpg?w=590&h=800&67FED11A-5F6D-4DDD-976215B41436D527',
      'https://www.designingbuildings.co.uk/w/images/b/b1/Carbon_footprint.png',
      'https://im.whatshot.in/img/2020/Feb/17493020-1624662024218621-8166650013843345075-o-fresh-to-home-cropped-1581593043.jpg',
      'https://images.theconversation.com/files/59824/original/vjxwjnmp-1411512845.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip',
      'https://static.stacker.com/s3fs-public/styles/sar_screen_maximum_large/s3/2019-08/Screen%20Shot%202019-08-30%20at%202.15.24%20PM.png',
      'https://img.etimg.com/thumb/msid-85067962,width-650,imgsize-615692,,resizemode-4,quality-100/global-warming_istock.jpg'
    ];
    final List<Widget> imageSliders = imgList
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
                          imageUrl: item,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Center(
                            child: Text(
                              '${imgList.indexOf(item)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
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
