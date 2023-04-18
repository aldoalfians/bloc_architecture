import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/models/data_home.dart';
import 'package:bloc_architecture/data/repositories/random_repository.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomRepository randomRepository;

  RandomBloc(this.randomRepository) : super(RandomInitial(DataHomeModel())) {
    on<GetRandomEvent>((event, emit) async {
      try {
        emit(RandomLoading(state.data));

        Map<String, dynamic> dataRandom =
            await randomRepository.getRandomData();

        if (dataRandom["error"] == true) {
          throw dataRandom["message"];
        } else {
          DataHomeModel dataHome = dataRandom["data"];
          emit(RandomCompleted(dataHome));
        }
      } catch (e) {
        emit(RandomError(state.data));
      }
    });
  }
}
