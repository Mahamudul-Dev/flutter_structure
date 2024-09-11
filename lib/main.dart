import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/bloc/auth_bloc.dart';
import 'package:flutter_structure/bloc/product_bloc.dart';
import 'package:flutter_structure/cubit/registration_from_cubit.dart';
import 'package:flutter_structure/network/auth_network.dart';
import 'package:flutter_structure/repository/auth_repository.dart';
import 'package:flutter_structure/repository/products_repository.dart';
import 'package:flutter_structure/routes/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context)=> AuthRepository(AuthNetwork()))
    ], child: MultiBlocProvider(providers: [
      BlocProvider(create: (_)=> ProductBloc(ProductsRepository())..add(GetProduct())),
        BlocProvider(create: (_)=> RegistrationFromCubit()),
        BlocProvider(create: (context)=> AuthBloc(context.read<AuthRepository>())),


    ], child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppPages.router,
    ),));
  }
}


// presentation             -- UI, Reusable
// business logic layer     -- Functions / Logic
// repository layer         -- Catch data from Network layer and convert them to Dart object
// network layer            -- API call

// route management         -- GoRouter