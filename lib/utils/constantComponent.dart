import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class ConstantComponentsUI{

   static Widget loadingIndicator = SizedBox(
    height: 50,
    width: 50,
    child: Center(
        child: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.red,
        size: 20,
      ),
    )),
  );

}