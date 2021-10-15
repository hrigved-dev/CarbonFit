import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixyourprint/widgets/AlternativesOverview.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AlternativesItem extends StatefulWidget {
  final String imgUrl;
  final String parameter;
  final String data;
  AlternativesItem({
    Key? key,
    required this.data,
    required this.imgUrl,
    required this.parameter,
  }) : super(key: key);

  @override
  _AlternativesItemState createState() => _AlternativesItemState();
}

class _AlternativesItemState extends State<AlternativesItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageTransition(
            child: AlternativesOverview(
              imgUrl: widget.imgUrl,
              parameter: widget.parameter,
              data: widget.data,
            ),
            type: PageTransitionType.fade));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 170,
            width: 400,
            child: Stack(fit: StackFit.expand, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: widget.parameter,
                  child: CachedNetworkImage(
                    imageUrl: widget.imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Center(
                child: Text(
                  widget.parameter,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      letterSpacing: 1,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
