import 'package:flutter/material.dart';

import '../core/view_modules.dart';

@viewModuleWidget
class ProductGrid extends StatelessWidget {
  const ProductGrid(this.viewModule, {super.key});
  final ViewModule viewModule;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Center(
        child: Text(viewModule.type),
      ),
    );
  }
}
