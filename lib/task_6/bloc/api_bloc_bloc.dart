import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_2/posts_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_bloc_event.dart';
part 'api_bloc_state.dart';

class ApiBlocBloc extends Bloc<ApiBlocEvent, ApiBlocState> {
  ApiBlocBloc() : super(ApiBlocInitial()) {
    on<ApiBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchPostEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ApiBlocLoading());

      try {
        final response = await AppService().getPost();
        emit(ApiBlocSuccess(posts: response));
      } catch (e) {
        emit(ApiBlocError());
      }
    });
  }
}
