import 'package:flutter_news_app_c9_online/home/model/NewsResponse.dart';

abstract class NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsErrorState extends NewsStates{
  String? errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccuessState extends NewsStates{
  List<News> newsList ;
  NewsSuccuessState({required this.newsList});
}

class MessageState extends NewsStates{
  String? message;
  MessageState({required this.message});
}
