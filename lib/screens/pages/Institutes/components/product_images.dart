import 'package:career_paths/api/Const%20Api/api_constant.dart';
import 'package:career_paths/model/gallery_model.dart';
import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../model/institute_model.dart';
import '../../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final List<Gallery> product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: CarouselSlider.builder(
            itemCount: widget.product.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Container(
                    height: 200,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 190, 190),
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.5),
                      child: FadeInImage(
                        placeholder:
                            const AssetImage('assets/images/no_institute.png'),
                        image: NetworkImage(ApiConstant.galleryUrl +
                            widget.product[index].appPhoto),
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/no_institute.png',
                            fit: BoxFit.contain,
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 165,
                    left: 15,
                    right: 0,
                    child: Text(
                      widget.product[index].title,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              // aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              viewportFraction: 1,
            ),
          ),
        ),
      ],
    );
  }
}
