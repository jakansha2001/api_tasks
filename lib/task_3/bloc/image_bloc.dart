import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_3/images_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<ImageEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetImageEvent>(_handleGetImageEvent);
  }

  Future<void> _handleGetImageEvent(
    GetImageEvent event,
    Emitter emit,
  ) async {
    try {
      emit(ImageLoadingState());
      final images = await AppService().getImage();
      emit(
        ImageSuccessState(image: images),
      );
    } catch (e) {
      emit(ImageErrorState());
    }
  }
}
