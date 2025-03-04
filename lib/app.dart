import 'package:ewa_store/bindings/general_bindings.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewa_store/utils/constants/text_strings.dart';
import 'package:ewa_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: TColors.black,
        body: Center(
          child: TAnimationLoaderWidget(
            text: 'Loading...',
            animation: TImages.loaderAnimation,
          ),
        ),
      ),
    );
  }
}
