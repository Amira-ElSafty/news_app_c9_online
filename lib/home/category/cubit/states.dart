import 'package:flutter_news_app_c9_online/home/model/SourcesResponse.dart';

abstract class SourceStates{}   /// parent class
class SourceLoadingState extends SourceStates {
  //todo: loadingMessage
}

class SourceErrorState extends SourceStates {
  String? errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSucuessState extends SourceStates {
  List<Source> sourceList ;
  SourceSucuessState({required this.sourceList});
}