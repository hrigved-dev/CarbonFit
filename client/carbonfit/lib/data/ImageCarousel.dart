import 'package:fixyourprint/models/ImageCarouselModel.dart';

class ImageCarouselData {
  List<ImageCarouselModel> getImageCarouselData() {
    var imageCarouselList = <ImageCarouselModel>[];

    var data1 = ImageCarouselModel(
        imgUrl:
            'https://www.worldatlas.com/r/w960-q80/upload/c0/db/55/shutterstock-189981317.jpg',
        quote:
            'Greenhouse gases are responsible for trapping heat in the atmosphere');
    imageCarouselList.add(data1);

    var data2 = ImageCarouselModel(
        imgUrl:
            'https://im.indiatimes.in/media/content/2016/Nov/pollution_inside_2_1479203012.jpg',
        quote:
            'India Continued With High Carbon Emission, While Global Count Went Stable In 2015');
    imageCarouselList.add(data2);

    var data3 = ImageCarouselModel(
        imgUrl:
            'https://carboncopy.info/wp-content/uploads/cropped-metro_20161206_carbon_emissions-e1481061661275.jpg',
        quote:
            'Carbon dioxide is released as a by-product of several human activities....');
    imageCarouselList.add(data3);

    var data4 = ImageCarouselModel(
        imgUrl:
            'https://assets.entrepreneur.com/content/3x2/2000/calculate-reduce-business-carbon-footprint.jpg?auto=webp&quality=95&crop=16:9&width=675',
        quote:
            'Using a more modern trucking fleet can be 20 percent more energy efficient');
    imageCarouselList.add(data4);

    var data5 = ImageCarouselModel(
        imgUrl:
            'https://static.toiimg.com/thumb/msid-80595570,imgsize-2203396,width-400,resizemode-4/80595570.jpg',
        quote:
            'If only more people lived in cities with decent public transportation and intrinsically low carbon emissions per capita.');
    imageCarouselList.add(data5);

    var data6 = ImageCarouselModel(
        imgUrl:
            'https://tse2.mm.bing.net/th?id=OIP.N5nc5Qrd6fHYTt_iBl-_eQHaDA&pid=Api&P=0&w=400&h=163',
        quote:
            'The Earth started to rebel when the carbon in the atmosphere began to swell.');
    imageCarouselList.add(data6);

    return imageCarouselList;
  }
}
