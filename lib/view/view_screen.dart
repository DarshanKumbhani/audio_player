import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/music_provider.dart';


class Play_music extends StatefulWidget {
  const Play_music({Key? key}) : super(key: key);

  @override
  State<Play_music> createState() => _Play_musicState();
}

class _Play_musicState extends State<Play_music> {
  Music? providerF;
  Music? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<Music>(context, listen: false).initAudio();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Music>(context, listen: false);
    providerT = Provider.of<Music>(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Music Player",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 70),
            Container(
              height: 35.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("${providerT!.baner90[providerT!.choiceIndex]}"),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
              ),
            ),

            // SizedBox(height: 20),
            // Text(
            //   "${providerT!.musicList[providerT!.choiceIndex].name}",
            //   style: TextStyle(
            //     fontSize: 30,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            // SizedBox(height: 10),
            // Text(
            //   "${providerT!.musicList[providerT!.choiceIndex].singar}",
            //   style: TextStyle(fontSize: 20, color: Colors.white70),
            // ),

            SizedBox(height: 20),
            PlayerBuilder.currentPosition(
              player: providerF!.assetsAudioPlayer!,
              builder: (context, position) => Column(
                children: [
                  Slider(
                    min: 0.0,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    max: providerT!.duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      position = Duration(seconds: value.toInt());
                      providerT!.assetsAudioPlayer!.seek(position);
                    },

                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${position}"),
                        Text("${providerT!.duration}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shuffle, size: 25,color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    providerT!.privies();
                  },
                  icon: Icon(Icons.skip_previous, size: 30,color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    if (providerT!.assetsAudioPlayer.isPlaying.value) {
                      providerF!.pauseAudio();
                    } else {
                      providerF!.playAudio();
                    }
                  },
                  child: providerT!.d
                      ? Icon(
                    Icons.pause,
                    size: 60,
                    color: Colors.white,
                  )
                      : Icon(
                    Icons.play_arrow,
                    size: 60,
                      color: Colors.white
                  ),
                ),
                IconButton(
                  onPressed: () {
                    providerT!.next();
                  },
                  icon: Icon(Icons.skip_next, size: 30,color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.loop, size: 30,color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}