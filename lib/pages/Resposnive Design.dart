import 'package:flutter/cupertino.dart';

class responsiveLayout extends StatelessWidget {
  final Widget mobile_layout;
  final Widget Tablet_layout;
  final Widget Web_layout;


 responsiveLayout({required this.mobile_layout,required this.Tablet_layout,required this.Web_layout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<600)
        {
          return mobile_layout;
        }
      else if(constraints.maxWidth<1100)
        {
          return Tablet_layout;

        }
      else
        {
          return Web_layout;
        }
    },);
  }
}
