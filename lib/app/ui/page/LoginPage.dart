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

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  static const String PATH = '/';

  LoginPage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {

  HomeBloc bloc;
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
      backgroundColor: Color.fromRGBO(210,214,222, 1),
        body: Center(
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                Container(
                  color: Colors.white,
                  width: 300,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildText("Username"),
                      buildText("Password"),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: false,
                          ),
                          Text("Remember me")
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: (){
                            AppProvider.getRouter(context).navigateTo(context, HomePage.PATH, transition: TransitionType.fadeIn);
                          },
                          color: Colors.blueAccent,
                          child: Text("Sign me in", style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget buildText(String label){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(child: Text(label, style: Theme.of(context).textTheme.bodyText1,), padding: EdgeInsets.symmetric(vertical: 5.0),),
          TextFormField(
            decoration: new InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _init(){
    if(null == bloc){
      bloc = HomeBloc(AppProvider.getApplication(context));
      bloc.isShowLoading.listen((bool isLoading){

      });
      bloc.loadFeedList();
    }
  }

}