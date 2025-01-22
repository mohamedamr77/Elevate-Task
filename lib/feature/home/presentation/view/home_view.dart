import 'package:elevatetask/core/helper/api_service.dart';
import 'package:elevatetask/feature/home/data/repo/home_implement.dart';
import 'package:elevatetask/feature/home/data/repo/home_repo.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/home_body.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  static String id = "home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(homeRepo: HomeRepoImplement(apiService: ApiService())),
        child: HomeBody(),
      ),
    );
  }
}
