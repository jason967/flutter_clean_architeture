import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bottom_navigation_cubit.dart';
import 'default_app_bar.dart';
import 'home_app_bar.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar(this.appBar, {super.key});
  final AppBar appBar;
  @override
  Widget build(BuildContext context) {
    final type = context.watch<BottomNavigaionCubit>().state.name;

    return (type.contains(BottomNavi.home.name))
        ? const HomeAppBar()
        : const DefaultAppBar();
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
