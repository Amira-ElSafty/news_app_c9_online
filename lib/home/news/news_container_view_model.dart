import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
  // hold data - handle logic
  List<News>? newsList ;
  String? errorMessage ;

  void getNewsBySourceId(String sourceId)async{
    newsList = null ;
    errorMessage = null ;
    notifyListeners();
    try{
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{
        newsList = response.articles ;
      }
    }catch(e){
      errorMessage = 'Error loading news list.';
    }
    notifyListeners();
  }
}