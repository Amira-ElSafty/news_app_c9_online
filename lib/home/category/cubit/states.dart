
import 'package:flutter_news_app_c9_online/model/SourceResponse.dart';

abstract class SourceStates{}
class SourceInitialState extends SourceStates{}
class SourceLoadingState extends SourceStates{}
class SourceErrorState extends SourceStates{
  String? errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccuessState extends SourceStates{
  List<Source> sourceList ;
  SourceSuccuessState({required this.sourceList});
}