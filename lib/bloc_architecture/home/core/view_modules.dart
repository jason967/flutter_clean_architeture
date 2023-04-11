import 'package:domain_layer/model/display/view_module/view_module.model.dart';
import 'package:e_commerce_architecture_ver_1_0/common/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:reflectable/reflectable.dart';
export 'package:domain_layer/model/display/view_module/view_module.model.dart';

import '../../../../main.reflectable.dart';

export '../view_modules/view_modules.dart';

class DataMirrors {
  Map<String, dynamic> mirrors = {};
  static final DataMirrors _instance = DataMirrors._internal();

  factory DataMirrors() => _instance;

  DataMirrors._internal();
}

class ViewModuleWidget extends Reflectable {
  const ViewModuleWidget()
      : super(invokingCapability, typingCapability, reflectedTypeCapability);
}

const viewModuleWidget = ViewModuleWidget();

void initReflect() {
  initializeReflectable();
  Map<String, dynamic> mirrors = DataMirrors().mirrors;

  for (var element in viewModuleWidget.annotatedClasses) {
    final moduleType = element.simpleName.toSnakeCase();
    mirrors[moduleType] = element;
  }
}

class ViewModuleFactory {
  final mirrors = DataMirrors().mirrors;
  Widget makeViewModule(ViewModule viewModule) {
    final type = viewModule.type;

    if (mirrors[type] == null) return const SizedBox.shrink();
    return (mirrors[type] as ClassMirror).newInstance('', [viewModule])
        as Widget;
  }
}
