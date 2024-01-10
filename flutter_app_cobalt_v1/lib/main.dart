/*import 'package:alarm_clock/Menu_icones/GeneratedIcone_acceuilWidget.dart';
import 'package:alarm_clock/Menu_icones/GeneratedSelection_iconeWidget.dart';
import 'package:alarm_clock/Menu_icones/Vecteurs_icones/GeneratedVector_acceuilWidget.dart';
import 'package:alarm_clock/models/menu_info.dart';

import 'package:alarm_clock/homepage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock/enums.dart';
import 'package:alarm_clock/data.dart';
*/
import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/page/accueil.dart';
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
import 'package:intl/date_symbol_data_local.dart';

void main() {initializeDateFormatting().then((_) => runApp(MyApp()));}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      
      );    
  }
}

