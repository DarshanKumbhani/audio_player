import 'package:audio_player/provider/music_provider.dart';
import 'package:audio_player/view/home_screen.dart';
import 'package:audio_player/view/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Music(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home_Screen(),
          'view':(context) => Play_music()


        },
      ),
    ),
  ));
}
