import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/app/bloc/HomeBloc.dart';
import 'package:flutter_starter_kit/app/model/core/AppProvider.dart';
import 'package:flutter_starter_kit/app/model/pojo/AppContent.dart';
import 'package:flutter_starter_kit/app/ui/page/AppDetailPage.dart';
import 'package:flutter_starter_kit/generated/i18n.dart';
import 'package:flutter_starter_kit/utility/widget/StreamListItem.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  static const String PATH = '/home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeBloc bloc;
  final TextEditingController _searchBoxController = new TextEditingController();
  Color greyColor = Color.fromARGB(255, 163, 163, 163);
  var _keys = {};
  var listViewKey = UniqueKey();

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
      appBar: AppBar(
        title: Text("OK")

      ),
      body: Row(
        children: <Widget>[
          menu(),
          menu()
        ],
      )
    );
  }

  Widget menu(){
    return Column(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _init(){
    if(null == bloc){
      bloc = HomeBloc(AppProvider.getApplication(context));
      bloc.isShowLoading.listen((bool isLoading){
        if(isLoading){
//          _showLoading();
        }
        else{
          Navigator.pop(context);
        }
      });
      bloc.loadFeedList();
    }
  }

  void _showLoading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        child: Dialog(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(S.of(context).dialogLoading)
                    )
                  ],
                )
            )
        )
    );
  }


}