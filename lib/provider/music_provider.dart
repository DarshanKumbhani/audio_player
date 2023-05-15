import 'dart:ffi';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class Music extends ChangeNotifier {
  List Musicposter = [
    "assets/Image/po1.jpg",
    "assets/Image/po2.jpg",
    "assets/Image/po3.jpg",
    "assets/Image/po4.jpg",
  ];

  List baneer20 = [
    "assets/Image/kalachashma.jpg",
    "assets/Image/kesariya.jpg",
    "assets/Image/maiyamenu.jpg",
    "assets/Image/malang sajna.jpg",
    "assets/Image/nayan.jpg",
    "assets/Image/pushpa.jpg",
    "assets/Image/ratalambiya.jpg",
    "assets/Image/suriliakhoyon.jpg",
    "assets/Image/zalima.jpg",
    "assets/Image/bedardeya.jpg",

  ];
  List top5 = [
    "assets/Image/bedardeya.jpg",
    "assets/Image/maiyamenu.jpg",
    "assets/Image/suriliakhoyon.jpg",
    "assets/Image/kalachashma.jpg",
    "assets/Image/9dekhne valo ne.jpg",
  ];
  List baner90 = [
    "assets/Image/9aye ho zindgime.jpg",
    "assets/Image/9dekhne valo ne.jpg",
        "assets/Image/9dil kaheta hai.jpg",
        "assets/Image/9kajra re.jpg",
        "assets/Image/9mein nikla.jpg",
        "assets/Image/9mera man kyu.jpg",
        "assets/Image/9sona kitna sona.jpg",
        "assets/Image/9soni de nakhre.jpg",
        "assets/Image/9tume dekhen.jpg",
        "assets/Image/9tumsa koi pyare.jpg",
  ];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration(seconds: 0);
  bool d=false;
  int choiceIndex=0;

  void initAudio(){
    assetsAudioPlayer.open(
      Playlist(startIndex: choiceIndex,audios: [
        Audio("assets/audio/9aye ho zindgime.mp3"),
        Audio("assets/audio/9dekhne valo ne.mp3"),
        Audio("assets/audio/9dil kaheta hai.mp3"),
        Audio("assets/audio/9kajra re.mp3"),
        Audio("assets/audio/9mein nikla.mp3"),
        Audio("assets/audio/9mera man kyu.mp3"),
        Audio("assets/audio/9sona kitna sona.mp3"),
        Audio("assets/audio/9soni de nakhre.mp3"),
        Audio("assets/audio/9tume dekhen.mp3"),
        Audio("assets/audio/9tumsa koi pyare.mp3"),
      ])
    );
  }
  List<Audio> song20 = [
    Audio("assets/audio/bedardeya.mp3"),
    Audio("assets/audio/kala chashma.mp3"),
    Audio("assets/audio/kesariya.mp3"),
    Audio("assets/audio/maiya menu.mp3"),
   Audio("assets/audio/malang.mp3"),
   Audio("assets/audio/nayan.mp3"),
   Audio("assets/audio/pushpa.mp3"),
   Audio("assets/audio/rata lambiya.mp3"),
   Audio("assets/audio/surili akhiyo.mp3"),
   Audio("assets/audio/zalima.mp3"),
  ];





  void playAudio()
  {
    assetsAudioPlayer.play();
    d=true;
    notifyListeners();
  }

  void pauseAudio()
  {
    assetsAudioPlayer.pause();
    d=false;
    notifyListeners();
  }

  void next()
  {
    assetsAudioPlayer.next();
    d=true;
    if(choiceIndex<4)
    {
      choiceIndex++;
    }
    else
    {
      choiceIndex=5;
    }
    notifyListeners();
  }

  void privies()
  {
    assetsAudioPlayer.previous();
    d=true;
    if(choiceIndex>0)
    {
      choiceIndex--;
    }
    else
    {
      choiceIndex=0;
    }
    notifyListeners();
  }

  void durationAudio()
  {
    assetsAudioPlayer.current.listen((event) {
      duration=event!.audio.duration;
    });
  }

  }


