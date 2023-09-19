import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_post_state.dart';
import 'package:patterns_bloc/service/log_service.dart';

import '../model/posts_model.dart';
import '../service/http_service.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(Posts posts) async {
    emit(CreatePostLoading());
    final response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(posts));
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Could not create post"));
    }
  }
}
