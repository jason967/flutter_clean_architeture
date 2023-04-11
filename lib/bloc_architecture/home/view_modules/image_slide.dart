import 'package:domain_layer/model/display/view_module/view_module.model.dart';
import 'package:flutter/material.dart';

import '../core/view_modules.dart';

@viewModuleWidget
class ImageSlide extends StatelessWidget {
  const ImageSlide(this.viewModule, {super.key});
  final ViewModule viewModule;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 353,
      // width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: PageView.builder(
        padEnds: false,
        itemCount: viewModule.items.length,
        itemBuilder: (context, index) {
          return Image.network(
            viewModule.items[index].image,
            // height: 300,
            // width: MediaQuery.of(context).size.width,
          );
        },
      ),
    );
  }
}
