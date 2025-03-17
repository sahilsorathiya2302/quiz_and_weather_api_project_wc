import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_app_bar.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_button.dart';

class CityPickScreen extends StatefulWidget {
  const CityPickScreen({super.key});

  @override
  State<CityPickScreen> createState() => _CityPickScreenState();
}

class _CityPickScreenState extends State<CityPickScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.blueAccent,
        text: AppString.selectCity,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return AppString.cities.where((city) => city
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String selection) {
                cityController.text = selection;
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                cityController = controller;
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppString.enterCity,
                  ),
                );
              },
            ),
          ),
          CustomButton(
            onPressed: () {
              String selectedCity = cityController.text;
              if (selectedCity.isNotEmpty) {
                Get.toNamed(AppRoutesName.weatherScreen,
                    arguments: {AppString.argumentKey: selectedCity});
              } else {
                Get.snackbar(AppString.error, AppString.errorMessage,
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            color: AppColors.blueAccent,
            text: AppString.submit,
          )
        ],
      ),
    );
  }
}
