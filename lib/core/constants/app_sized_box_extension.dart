import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppSizedBoxExtension on num {
  SizedBox get sizeWidget => SizedBox(width: w, height: h);

  SizedBox get sizeHeight => SizedBox(height: h);
  SizedBox get sizeWidth => SizedBox(width: w);
}
