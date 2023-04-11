import 'dart:developer';

import 'package:domain_layer/model/common/request.model.dart';
import 'package:domain_layer/model/display/collection/collection.model.dart';
import 'package:domain_layer/model/display/view_module/view_module.model.dart';
import 'package:domain_layer/usecase/display/get_view_modules.dart';
import 'package:domain_layer/usecase/display_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/bloc/bolc_utils.dart';
import '../../cubit/store_type_cubit.dart';

part 'view_modules_state.dart';
part 'view_modules_event.dart';

part 'view_modules_bloc.freezed.dart';

@injectable
class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;
  ViewModulesBloc(this._displayUsecase)
      : super(ViewModulesState(status: BlocStatus.initial)) {
    on<ViewModulesInitialized>(_onViewModulesInit);
    on<ViewModulesChanged>(_onViewModulesChanged);
  }

  Future _onViewModulesInit(
      ViewModulesInitialized event, Emitter<ViewModulesState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      Map<String, List<ViewModule>> modules = {};

      for (final collection in event.collections) {
        modules[collection.tabId] = [];
      }
      final storeType = event.storeType;
      final mainTab = event.collections.first.tabId;

      final path = '/${storeType.name}/$mainTab';
      Map<String, String> params = {};
      final request = Request(path: path, params: params);
      final result = await _displayUsecase<ViewModule>(GetViewModules(request));

      modules[mainTab] = result;

      // await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          status: BlocStatus.success,
          viewModules: modules,
          collection: mainTab,
        ),
      );
    } catch (e) {
      log('[error] $e');
      emit(state.copyWith(status: BlocStatus.failure));
    }
  }

  Future _onViewModulesChanged(
      ViewModulesChanged event, Emitter<ViewModulesState> emit) async {
    final storeType = state.storeType;
    final tabId = event.tabId;

    Map<String, List<ViewModule>> modules = {...state.viewModules};

    if (modules[tabId] == null || modules[tabId]!.isEmpty) {
      emit(state.copyWith(status: BlocStatus.loading));

      final path = '/${storeType.name}/$tabId';
      Map<String, String> params = {};
      final request = Request(path: path, params: params);
      final viewModule =
          await _displayUsecase<ViewModule>(GetViewModules(request));

      modules[tabId] = viewModule;
      await Future.delayed(const Duration(seconds: 3));
      emit(
        state.copyWith(
          status: BlocStatus.success,
          collection: tabId,
          viewModules: modules,
        ),
      );

      return;
    }

    emit(state.copyWith(collection: tabId));
  }
}
