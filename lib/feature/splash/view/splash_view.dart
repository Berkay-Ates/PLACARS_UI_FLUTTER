import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../view_model/splash_view_model.dart';

import '../../../product/image/image_enums.dart';

class SplashHomeView extends StatelessWidget {
  const SplashHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Image.asset(ImageEnumName.splash.imagePath, width: 312),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          );
        });
  }
}
