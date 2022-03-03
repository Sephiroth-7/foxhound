// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
// On appel le state initial
  CounterBloc() : super(0);

  // LE CODE ME  PROPOSE PAS DE REDEFINIR LES METHODES (à VERIFIER)
  // il faut mettre async* pour utiliser le yield (dans un STREAM)
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 100;
        break;

      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
