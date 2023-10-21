import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/states.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel():super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response.status == 'error'){
        emit(SourceErrorState(errorMessage: response.message ));
        return ;
      }
      if(response.status == 'ok'){
        emit(SourceSucuessState(sourceList: response.sources!));
        return ;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: 'Error Loading Source List'));
    }
  }

}
