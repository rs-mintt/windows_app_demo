import 'package:fluent_ui/fluent_ui.dart';
import 'package:windows_app_demo/components/color_constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.network(
            'https://pbs.twimg.com/media/Eu7e3mQVgAImK2o.png',
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Listen to trending songs all the time',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 12.0),
                Text('With Fluttify you can get premium music\nanywhere and at any time', style: TextStyle(color: Colors.white),),
                SizedBox(height: 16.0),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
