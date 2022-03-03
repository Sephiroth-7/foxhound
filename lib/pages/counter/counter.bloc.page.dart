import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxhound/bloc/counter.bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("Widget render ..........");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BLOC"),
      ),
      // On enveloppe avec le BlocBuilder qui est l'équivalent du Consumer
      // Il fait un listen vers le bloc, dés qu'il recoit un state il l'affiche
      // On spécifie le  type du bloc que l'on va écouter ici c'est counter cubit
      // Et le type du state (int ici)
      body: BlocBuilder<CounterBloc, int>(
        // On recoit informations émises dans le state et on peut les afficher
        builder: (context, state) {
          return Center(
            child: Text("Counter Value => $state",
                style: Theme.of(context).textTheme.bodyText1),
            //Pour que la modification des boutons soit prise ``
            //en compte il faut utiliser « setState qui hérite de State»
            //La méthode state permet de rafraichir tous les composants
            //quand une action est faite
            // Ce qui MONTRE la DIFFERENCE entre un SLESSW et SFULLW
            //Mais le problème c'est qu'il régénrer tout le contenu du build
            //Cela peut poser problème
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //J'ai rajouté heroTag car ça fonctionnait pas sans (Error Hero...)
            heroTag: "btn1",
            onPressed: () {
              //on utilise l'objet copntext avec le .read
              // On spécifie le type de l'objet que l'on veut récuperer qui est
              // CounterCubit suivi de la méthode (.decrement)
              context.read<CounterBloc>().add(CounterEvent.decrement);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              context.read<CounterBloc>().add(CounterEvent.increment);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
