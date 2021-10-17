import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://www.worldatlas.com/r/w960-q80/upload/c0/db/55/shutterstock-189981317.jpg',
      'https://im.indiatimes.in/media/content/2016/Nov/pollution_inside_2_1479203012.jpg',
      'https://carboncopy.info/wp-content/uploads/cropped-metro_20161206_carbon_emissions-e1481061661275.jpg',
      'https://assets.entrepreneur.com/content/3x2/2000/calculate-reduce-business-carbon-footprint.jpg?auto=webp&quality=95&crop=16:9&width=675',
      'https://static.toiimg.com/thumb/msid-80595570,imgsize-2203396,width-400,resizemode-4/80595570.jpg',
      'https://tse2.mm.bing.net/th?id=OIP.N5nc5Qrd6fHYTt_iBl-_eQHaDA&pid=Api&P=0&w=400&h=163',
    ];
    final List<String> quotes = [
    'Greenhouse gases are responsible for trapping heat in the atmosphere',
    'India Continued With High Carbon Emission, While Global Count Went Stable In 2015',
    'Carbon dioxide is released as a by-product of several human activities....',
    'Using a more modern trucking fleet can be 20 percent more energy efficient',
    'If only more people lived in cities with decent public transportation and intrinsically low carbon emissions per capita. If only more people were more civilized.',
    'The Earth started to rebel when the carbon in the atmosphere began to swell.',
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
