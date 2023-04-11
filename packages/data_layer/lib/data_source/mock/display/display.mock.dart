import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../../../dto/display/collections/collection.dto.dart';
import '../../../dto/display/view_module/view_module.dto.dart';

class DisplayMock {
  Future<List<CollectionDto>?> getCollectionsJson(String path) async {
    final storeType = path.replaceAll('/', '');
    final jsonString = await rootBundle.loadString(
        'packages/data_layer/assets/json/collections_$storeType.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);

    final collections = [
      for (final data in jsonResponse) CollectionDto.fromJson(data)
    ];

    return collections;
  }

  Future<List<ViewModuleDto>?> getViewModulesJson(String path) async {
    final collection = path.replaceAll('/', '_');

    final jsonString = await rootBundle.loadString(
        'packages/data_layer/assets/json/view_modules$collection.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);

    final viewModules = [
      for (final data in jsonResponse) ViewModuleDto.fromJson(data)
    ];

    return viewModules;
  }
}
