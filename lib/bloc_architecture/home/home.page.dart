import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import '../common/bloc/bolc_utils.dart';
import 'bloc/collections/collections_bloc.dart';

import 'bloc/view_modules/view_modules_bloc.dart';
import 'component/collections_bar.dart';
import 'cubit/store_type_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              locator<CollectionsBloc>()..add(CollectionsInitialized()),
        ),
        BlocProvider(
          create: (_) => locator<ViewModulesBloc>(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreTypeCubit, StoreType>(
      listenWhen: (previous, current) => (previous.index != current.index),
      listener: ((context, state) =>
          context.read<CollectionsBloc>().add(CollectionsChanged(state))),
      child: BlocBuilder<CollectionsBloc, CollectionsState>(
        builder: (context, state) {
          switch (state.status) {
            case BlocStatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case BlocStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case BlocStatus.success:
              return CollectionsBar(
                key: UniqueKey(),
                collections: state.collections,
                storeType: state.storeType,
              );
            case BlocStatus.failure:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
