import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsImage extends StatelessWidget {
  final String imageSource;
  const NewsImage(this.imageSource,{super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageSource,
      width: 70.w,
      height: 65.w,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
        Icon(Icons.broken_image, size: 70.w),
    );
  }
}