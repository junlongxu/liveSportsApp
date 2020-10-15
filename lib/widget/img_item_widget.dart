import 'package:flutter/material.dart';

class ImgItemWidget extends StatelessWidget {
  final String imgUrl;
  final Widget bottomChild;
  final Widget centerChild;
  const ImgItemWidget({
    @required this.imgUrl,
    this.bottomChild,
    this.centerChild,
  });
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
          onTap: () {
          },
          child: Column(
            children: <Widget>[
              // Image.network(imgUrl,fit: BoxFit.cover)
              Container(
                height: 100,
                // transform: Matrix4.compose(translation, rotation, scale),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.fill),
                ),
              ),
              Center(child: centerChild),
              bottomChild
            ],
          )),
    );
  }
}
