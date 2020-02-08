import 'package:fluro/fluro.dart';
import 'package:flutter_starter_kit/app/model/api/APIProvider.dart';
import 'package:flutter_starter_kit/app/model/api/AppStoreAPIRepository.dart';
import 'package:flutter_starter_kit/app/model/core/AppRoutes.dart';
import 'package:flutter_starter_kit/config/Env.dart';
import 'package:flutter_starter_kit/utility/db/DatabaseHelper.dart';
import 'package:flutter_starter_kit/utility/framework/Application.dart';
import 'package:flutter_starter_kit/utility/log/Log.dart';
import 'package:logging/logging.dart';

class AppStoreApplication implements Application {
  Router router;
  DatabaseHelper _db;
  AppStoreAPIRepository appStoreAPIRepository;

  @override
  Future<void> onCreate() async {
    _initLog();
    _initRouter();
//    await _initDB();
//    _initDBRepository();
    _initAPIRepository();
  }

  @override
  Future<void> onTerminate() async {
    await _db.close();
  }

  void _initAPIRepository(){
    APIProvider apiProvider = APIProvider();
    appStoreAPIRepository = AppStoreAPIRepository(apiProvider);
  }

  void _initLog(){
    Log.init();

    switch(Env.value.environmentType){
      case EnvType.TESTING:
      case EnvType.DEVELOPMENT:
      case EnvType.STAGING:{
        Log.setLevel(Level.ALL);
        break;
      }
      case EnvType.PRODUCTION:{
        Log.setLevel(Level.INFO);
        break;
      }
    }
  }

  void _initRouter(){
    router = new Router();
    AppRoutes.configureRoutes(router);
  }
}