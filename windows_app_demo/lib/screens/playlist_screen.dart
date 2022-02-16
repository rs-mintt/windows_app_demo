import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:windows_app_demo/components/home_banner.dart';
import 'package:windows_app_demo/components/music_player.dart';
import 'package:windows_app_demo/components/popular_card.dart';
import 'package:windows_app_demo/components/recent_playlist.dart';
import 'package:windows_app_demo/data/data.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Playlist'),
      ),
      content: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeBanner(),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Popular now',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('See more')
                          ],
                        ),
                        const SizedBox(height: 15),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                listSongs.length,
                                (index) => PopularCard(
                                      title: listSongs[index].title,
                                      artist: listSongs[index].artist,
                                      imageUrl: listSongs[index].imageUrl,
                                    )),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'My recent playlist',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('See more')
                          ],
                        ),
                        const SizedBox(height: 15),
                        RecentPlaylist(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Playing',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(FluentIcons.collapse_menu),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // GestureDetector(
                      //   child: Text('Play'),
                      //   onTap: () async {
                      //     final player = AudioPlayer();
                      //     await player.play('easy-on-me.mp3', isLocal: true);
                      //   },
                      // ),
                      PlayTest(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
