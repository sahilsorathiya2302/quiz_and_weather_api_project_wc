import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/component/custom_button.dart';
import 'package:quiz_api_project_wc/core/constraints/app_string.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';

import '../../../core/theme/app_colors.dart';

class WeatherButton extends StatelessWidget {
  const WeatherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Get.toNamed(AppRoutesName.cityPicker);
      },
      text: AppString.checkWeather,
      color: AppColors.blueAccent,
    );
  }
}
