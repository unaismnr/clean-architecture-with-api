import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_project/features/domain/entities/post_entity.dart';
import 'package:clean_arch_project/features/domain/usecases/post_usecase.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await PostUsecase().getAllPostFromDataSource();
        emit(PostLoaded(posts: posts));
      } catch (e) {
        log(e.toString());
        emit(PostError(error: e.toString()));
      }
    });
  }
}
