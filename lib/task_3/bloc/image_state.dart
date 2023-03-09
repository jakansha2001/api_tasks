part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoadingState extends ImageState {}

class ImageErrorState extends ImageState {}

class ImageSuccessState extends ImageState {
  final List<ImagesModel> image;

  ImageSuccessState({required this.image});
}
