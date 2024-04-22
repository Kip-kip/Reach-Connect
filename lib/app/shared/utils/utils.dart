export 'common_widget.dart';
export 'focus.dart';
export 'navigator_helper.dart';
export 'regex.dart';
export 'size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container ImagePlaceholder({width:68.0}) {
  return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.black12,width: 0.5),
        image: const DecorationImage(
            image: AssetImage('assets/images/avatar60.jpeg'),
            fit: BoxFit.cover),
      ));
}

goBack(){
  if( Get.rootDelegate.history.length >1){
    var lastLocation = Get.rootDelegate.history[Get.rootDelegate.history.length-2].location;
    Get.rootDelegate.backUntil(lastLocation!);
  }
}
