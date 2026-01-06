import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ozet_haber/constants/colors_const.dart';

class DividerForDrawer extends StatelessWidget {
  const DividerForDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 16.0.w, 
      endIndent: 16.0.w,
      color: ColorsConst.lightGray,
      thickness: 2.0.w,
    );
  }
}