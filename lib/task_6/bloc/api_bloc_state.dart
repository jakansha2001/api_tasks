part of 'api_bloc_bloc.dart';

@immutable
abstract class ApiBlocState {}

class ApiBlocInitial extends ApiBlocState {}

class ApiBlocLoading extends ApiBlocState {}

class ApiBlocSuccess extends ApiBlocState {
  final List<PostsModel> posts;

  ApiBlocSuccess({required this.posts});
}

class ApiBlocError extends ApiBlocState {}
