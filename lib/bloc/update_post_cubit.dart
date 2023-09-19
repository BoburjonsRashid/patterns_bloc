import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_post_state.dart';

import '../model/posts_model.dart';
import '../service/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Posts posts) async {
    emit(UpdatePostLoading());
    final response =
        await Network.PUT(Network.API_UPDATE+posts.id.toString(), Network.paramsUpdate(posts));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Could not update post"));
    }
  }
}
