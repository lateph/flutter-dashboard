import 'package:flutter_starter_kit/app/model/api/APIProvider.dart';
import 'package:flutter_starter_kit/app/model/pojo/AppContent.dart';
import 'package:flutter_starter_kit/app/model/pojo/Entry.dart';
import 'package:flutter_starter_kit/app/model/pojo/response/LookupResponse.dart';
import 'package:flutter_starter_kit/app/model/pojo/response/TopAppResponse.dart';
import 'package:rxdart/rxdart.dart';

class AppStoreAPIRepository{
  static const int TOP_100 = 100;
  static const int TOP_10 = 10;

  APIProvider _apiProvider;

  AppStoreAPIRepository(this._apiProvider);


  Observable<List<AppContent>> _convertFromEntry(TopAppResponse response){
    List<AppContent> appContent = [];
    for(Entry entry in response.feed.entry){
      appContent.add(AppContent.fromEntry(entry));
    }
    return Observable.just(appContent);
  }
}