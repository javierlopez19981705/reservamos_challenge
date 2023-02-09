import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/home/cubit/home_cubit.dart';
import 'package:reservamos_challenge/src/pages/home/view/home_page.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ReservamosRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              context.read<ReservamosRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            'home': (context) => const HomePage(),
          },
          initialRoute: 'home',
        ),
      ),
    );
  }
}
