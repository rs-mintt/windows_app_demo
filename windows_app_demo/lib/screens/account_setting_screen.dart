import 'package:fluent_ui/fluent_ui.dart';
import 'package:windows_app_demo/components/color_constants.dart';


import 'package:email_validator/email_validator.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final _clearController = TextEditingController();
  bool _showPassword = false;
  String? comboBoxValue;

  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Account settings')),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Setting your account',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: kDarkColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.network(
                    'https://docs.flutter.dev/assets/images/dash/Dashatars.png',
                    width: 800,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: Container(
                width: 320,
                child: _formLogin(),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextFormBox(
          header: 'Email',
          placeholder: 'Type your email here',
          autovalidateMode: AutovalidateMode.always,
          validator: (text) {
            if (text == null || text.isEmpty) return 'Enter your email';
            if (!EmailValidator.validate(text)) return 'Invalid email';
            return null;
          },
          textInputAction: TextInputAction.next,
          prefix: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(FluentIcons.edit_mail),
          ),
        ),
        const SizedBox(height: 30),
        TextBox(
          header: 'Bio',
          maxLines: null,
          controller: _clearController,
          suffixMode: OverlayVisibilityMode.always,
          minHeight: 100,
          suffix: IconButton(
            icon: const Icon(FluentIcons.chrome_close),
            onPressed: () {
              _clearController.clear();
            },
          ),
        ),
        const SizedBox(height: 20),
        TextBox(
          header: 'Password',
          placeholder: 'Type your password here',
          obscureText: !_showPassword,
          maxLines: 1,
          suffixMode: OverlayVisibilityMode.always,
          suffix: IconButton(
            icon: Icon(
              !_showPassword ? FluentIcons.lock : FluentIcons.unlock,
            ),
            onPressed: () => setState(() => _showPassword = !_showPassword),
          ),
        ),
        const SizedBox(height: 20),
        DatePicker(
          header: 'Date of birth',
          selected: date,
          onChanged: (v) => setState(() => date = v),
        ),
        const SizedBox(height: 20),
        _loginWithButton(),
      ],
    );
  }

  Widget _loginWithButton() {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) {
            return ContentDialog(
              title: Text('Save infomation'),
              content: Text('You information has been saved'),
              actions: [
                Button(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
              ],
            );
          },
        );
      },
      child: Container(
        width: 90,
        height: 45,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }
}