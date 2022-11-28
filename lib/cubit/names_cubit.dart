import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/constants/names.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() {
    emit(names.getRandomElement());
  }
}
