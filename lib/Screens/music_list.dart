// music_list.dart
import 'package:flutter/material.dart';
import 'package:song_app/Screens/music_player.dart';
import 'package:song_app/helperWidgets/models/music.dart';

class MyHomePage extends StatelessWidget {
  final List<Music> playlist;

  const MyHomePage({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Playlist'),
      ),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          String songName = '';
          String artistName = '';

          // Set specific song names based on index
          if (index == 0) {
            songName = 'Starboy';
            artistName = 'The Weeknd';
          } else if (index == 1) {
            songName = 'Yazmeely';
            artistName = 'Muhab';
          } else if (index == 2) {
            songName = 'Cut to the Feeling';
            artistName = 'Carly Rae Jepsen';
          }

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayer(song: playlist[index]),
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(songName),
                subtitle: Text(artistName),
              ),
            ),
          );
        },
      ),
    );
  }
}
