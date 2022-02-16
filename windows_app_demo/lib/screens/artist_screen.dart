import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('Artist'),
      ),
    );
  }
}
