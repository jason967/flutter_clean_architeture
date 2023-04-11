import 'dart:developer';

import 'package:data_layer/common/mapper/display/display.mapper.dart';
import 'package:dio/dio.dart';
import 'package:domain_layer/model/display/collection/collection.model.dart';
import 'package:domain_layer/model/display/view_module/view_module.model.dart';
import 'package:domain_layer/repository/display.repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/mock/display/display.mock.dart';

@Injectable(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final Dio _dio;

  DisplayRepositoryImpl(this._dio);

  @override
  Future<List<Collection>> getCollections(
      {required String path, Map<String, String>? queries}) async {
    // final restClient = RestClient(_dio);
    // final sample = restClient.getCollections();

    final jsonSample = await DisplayMock().getCollectionsJson(path);

    final collections = jsonSample?.map((e) => e.toModel()).toList() ?? [];

    return collections;
  }

  @override
  Future<List<ViewModule>> getViewModules(
      {required String path, Map<String, String>? queries}) async {
    final jsonSample = await DisplayMock().getViewModulesJson(path);

    final viewModules = jsonSample?.map((e) => e.toModel()).toList() ?? [];

    return viewModules;
  }
}
