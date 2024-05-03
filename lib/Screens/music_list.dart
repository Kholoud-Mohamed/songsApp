import 'package:flutter/material.dart';
import 'package:song_app/Screens/music_player.dart';
import 'package:song_app/constants.dart';
import 'package:song_app/helperWidgets/models/music.dart';

class MyHomePage extends StatelessWidget {
  final List<Music> playlist;

  const MyHomePage({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 223, 226),
        centerTitle: true,
        title: const Text(
          'Music Playlist',
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 91, 88, 88),
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 219, 223, 226),
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
          } else if (index == 3) {
            songName = 'Allah Aleik Ya Seedy';
            artistName = 'Ehab Tawfik';
          } else if (index == 4) {
            songName = 'Ya Hayat Albe';
            artistName = 'Haifa Wehbe';
          } else if (index == 5) {
            songName = 'Wada3 ya donia Wada3';
            artistName = 'Hamo Beka';
          } else if (index == 6) {
            songName = 'Hayaty Mesh Tmam';
            artistName = 'Ramy Sabry';
          } else if (index == 7) {
            songName = 'Haygely Mawgo3';
            artistName = 'Ramy Ashour';
          } else if (index == 8) {
            songName = 'Sabry Alill';
            artistName = 'Sherine';
          } else if (index == 9) {
            songName = 'Diva';
            artistName = 'Sharmoofers';
          } else if (index == 10) {
            songName = 'Ryah El Hayah';
            artistName = 'Hamza Namira';
          } else if (index == 11) {
            songName = '7ala';
            artistName = 'Afroto';
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
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: const Color(0xffFFE4EB)
                  .withOpacity(0.8), // Set the card color with transparency
              child: ListTile(
                title: Text(
                  songName,
                  style: const TextStyle(
                      fontFamily: 'Nunito Sans',
                      color: Color.fromARGB(
                          255, 88, 91, 92), // Color of the song name text
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: Text(artistName,
                    style: const TextStyle(
                        fontFamily: 'Nunito Sans', fontSize: 8.5)),
              ),
            ),
          );
        },
      ),
    );
  }
}
