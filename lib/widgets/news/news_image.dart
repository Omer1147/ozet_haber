import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsImage extends StatelessWidget {
  final String imageSource;
  const NewsImage(this.imageSource,{super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageSource,
      width: 90.w,
      height: 85.w,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
        Icon(Icons.broken_image, size: 90.w),
    );
  }
}