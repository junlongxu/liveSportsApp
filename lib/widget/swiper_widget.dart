import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  final List bannerList;
  final double height;
  SwiperWidget({@required this.bannerList, this.height = 150});

  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Swiper(
        autoplay: true,
        itemCount: widget.bannerList?.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // NavigatorUtil.push();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.bannerList[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        pagination: SwiperPagination(),
        viewportFraction: 0.94,
        scale: 0.9,
      ),
    );
  }
}


