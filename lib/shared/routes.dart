import 'package:charadas/screens/home/home_module.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes(BuildContext context) => {
      '/': (context) => HomeModule(),
    };
