import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:windows_app_demo/data/data.dart';

class RecentPlaylist extends StatelessWidget {
  const RecentPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: listSongs
          .map((song) => DataRow(cells: [
                DataCell(
                  Text(song.title),
                ),
                DataCell(
                  Text(song.artist),
                ),
                DataCell(
                  Text(song.album),
                ),
                DataCell(
                  Text(song.duration),
                ),
              ]))
          .toList(),
    );
  }
}
