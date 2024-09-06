import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoooappppppp/pages/MobileLayout.dart';
import 'package:todoooappppppp/pages/Resposnive%20Design.dart';
import 'package:todoooappppppp/pages/Tablayout.dart';
import 'package:todoooappppppp/pages/WebLayout.dart';

import '../utitl/listfile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _mybox=Hive.box('myBox');

  @override
  void initState() {
    if(_mybox.get('Todolist')==null)
      {
        db.CreateinititalData();
      }
    else
      {
        db.loaddata();
      }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: responsiveLayout(mobile_layout: Mobilelayout() , Tablet_layout: Tablayout(), Web_layout: WebLayout()),
    );
  }
}
