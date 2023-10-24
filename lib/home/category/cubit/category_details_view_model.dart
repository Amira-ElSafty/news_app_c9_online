
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/states.dart';
import 'package:flutter_news_app_c9_online/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_news_app_c9_online/repository/source/repository/source_repository_impl.dart';
import 'package:flutter_news_app_c9_online/repository/source/source_repository_contract.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
   SourceRepositoryContract repositoryContract ;
  CategoryDetailsViewModel(this.repositoryContract):super(SourceLoadingState());

  void getSourcesByCategoryId(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await repositoryContract.getSourceByCategoryId(categoryId);
      if(response?.status == 'error'){
        emit(SourceErrorState(errorMessage: response!.message));
      }else{ /// response.status == 'ok
        emit(SourceSuccuessState(sourceList: response!.sources!));
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: 'Error Loading Source List'));
    }
  }
}
// todo: loading error succuess