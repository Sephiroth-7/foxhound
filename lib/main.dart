import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxhound/pages/home.page.dart';

import 'bloc/counter.bloc.dart';
import 'bloc/counter.cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //On utilise Multiprovider pour le provider
    return MultiBlocProvider(
      // le CUBIT attent la valeur initiale du state qui est ici notre compteur
      // On va instancier un objet de type blocprovider qui recoit CounterCubit
      providers: [
        BlocProvider(create: (context) => CounterCubit(0)),
        BlocProvider(create: (context) => CounterBloc())
      ],

      child: MaterialApp(
        routes: {
          "/": (context) => const HomePage(),
          // "/login": (context) => const WelcomePage(),
        },
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey,
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyText2: TextStyle(fontSize: 40, color: Colors.blue),
              bodyText1: TextStyle(fontSize: 30, color: Colors.blue),
            )),
      ),
    );
  }
}
