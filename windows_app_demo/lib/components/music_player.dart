import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:windows_app_demo/components/color_constants.dart';

class PlayTest extends StatefulWidget {
  const PlayTest({Key? key}) : super(key: key);

  @override
  _PlayTestState createState() => _PlayTestState();
}

class _PlayTestState extends State<PlayTest> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  AudioPlayer? _player;
  AudioCache? cache;
  PlayerState? playerState;

  Duration position = Duration();
  Duration musicLength = Duration();

  Widget slider() {
    return SizedBox(
      width: 200,
      child: Slider(
          activeColor: kDarkColor,
          inactiveColor: kPrimaryColor,
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player?.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player?.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player?.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.scdn.co/image/ab67616d0000b27350dba34377a595e35f81b0e4'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Easy on me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    // "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                    "00:00",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  slider(),
                  const Text(
                    // "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                    "3:44",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  color: kDarkColor,
                  iconSize: 45.0,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                  ),
                ),
                IconButton(
                  iconSize: 62.0,
                  color: kDarkColor,
                  onPressed: () {
                    //here we will add the functionality of the play button
                    if (!playing) {
                      //now let's play the song
                      cache?.play("easy-on-me.mp3");
                      setState(() {
                        playBtn = Icons.pause;
                        playing = true;
                      });
                    } else {
                      _player?.pause();
                      setState(() {
                        playBtn = Icons.play_arrow;
                        playing = false;
                      });
                    }
                  },
                  icon: Icon(
                    playBtn,
                  ),
                ),
                IconButton(
                  iconSize: 45.0,
                  color: kDarkColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                  ),
                ),
              ],
            )
            // Container(
            //   width: 100,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         "${3}:${3.remainder(60)}",
            //         style: const TextStyle(
            //           fontSize: 18.0,
            //         ),
            //       ),
            //       const Text(
            //         "${3}:${3}",
            //         style: TextStyle(
            //           fontSize: 18.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
