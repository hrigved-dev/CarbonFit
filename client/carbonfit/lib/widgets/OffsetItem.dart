import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixyourprint/widgets/OffsetDetail.dart';
import 'package:flutter/material.dart';

class OffsetItem extends StatefulWidget {
  final String Name;
  final String Id;
  final String Brief;
  final String Min;
  final String Availability;
  final String Link;
  final String Image;
  const OffsetItem(
      {Key? key,
      required this.Name,
      required this.Availability,
      required this.Brief,
      required this.Id,
      required this.Image,
      required this.Link,
      required this.Min})
      : super(key: key);

  @override
  _OffsetItemState createState() => _OffsetItemState();
}

class _OffsetItemState extends State<OffsetItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OffsetDetail(
                Id: widget.Id,
                Name: widget.Name,
                Availability: widget.Availability,
                Brief: widget.Brief,
                Image: widget.Image,
                link: widget.Link,
                Min: widget.Min)));
      },
      child: Column(
        children: [
          Container(
            height: 120,
            width: 400,
            decoration: BoxDecoration(
              color: Color(0XFFF3EFCC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 100,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Hero(
                    tag: widget.Availability,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: widget.Image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  width: 180,
                  child: Text(
                    widget.Name,
                    style: TextStyle(
                        fontFamily: 'Lato', fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
