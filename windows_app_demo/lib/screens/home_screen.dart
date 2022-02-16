import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:windows_app_demo/components/color_constants.dart';
import 'package:windows_app_demo/main.dart';
import 'package:windows_app_demo/screens/account_setting_screen.dart';
import 'package:windows_app_demo/screens/artist_screen.dart';
import 'package:windows_app_demo/screens/general_settings_screen.dart';
import 'package:windows_app_demo/screens/playlist_screen.dart';
import 'package:windows_app_demo/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    return NavigationView(
      appBar: NavigationAppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        title: () {
          if (kIsWeb) return const Text(appTitle);
          return MoveWindow(
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(appTitle),
            ),
          );
        }(),
        actions: kIsWeb
            ? null
            : MoveWindow(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [Spacer(), WindowButtons()],
                ),
              ),
        leading: const Center(
          child: FlutterLogo(
            size: 25,
          ),
        ),
      ),
      pane: NavigationPane(
        selected: _currentIndex,
        displayMode: appTheme.displayMode,
        indicatorBuilder: () {
          switch (appTheme.indicator) {
            case NavigationIndicators.end:
              return NavigationIndicator.end;
            case NavigationIndicators.sticky:
            default:
              return NavigationIndicator.sticky;
          }
        }(),
        onChanged: (index) => setState(() {
          _currentIndex = index;
        }),
        size: const NavigationPaneSize(
          openMinWidth: 250,
          openMaxWidth: 320,
        ),
        header: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: DefaultTextStyle(
            style: FluentTheme.of(context).typography.title!,
            child: const Text('Fluttify'),
          ),
        ),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.music_note),
            title: const Text('Playlist'),
          ),
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.reminder_person),
            title: const Text('Artist'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.album),
            title: const Text('Album'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.heart),
            title: const Text('Favorites'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.trending12),
            title: const Text('Popular'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.playlist_music),
            title: const Text('My Playlist'),
          ),
        ],
        autoSuggestBox: AutoSuggestBox(
          controller: TextEditingController(),
          items: const ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
        ),
        autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('General Settings'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
            title: const Text('Account Settings'),
          ),
        ],
      ),
      content: NavigationBody(
        index: _currentIndex,
        children: [
          PlaylistScreen(),
          ArtistScreen(),
          ScaffoldPage(),
          ScaffoldPage(),
          ScaffoldPage(),
          ScaffoldPage(),
          Settings(),
          AccountSettingScreen(),
        ],
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    assert(debugCheckHasFluentLocalizations(context));
    final ThemeData theme = FluentTheme.of(context);
    final buttonColors = WindowButtonColors(
      iconNormal: theme.inactiveColor,
      iconMouseDown: theme.inactiveColor,
      iconMouseOver: theme.inactiveColor,
      mouseOver: ButtonThemeData.buttonColor(
          theme.brightness, {ButtonStates.hovering}),
      mouseDown: ButtonThemeData.buttonColor(
          theme.brightness, {ButtonStates.pressing}),
    );
    final closeButtonColors = WindowButtonColors(
      mouseOver: Colors.red,
      mouseDown: Colors.red.dark,
      iconNormal: theme.inactiveColor,
      iconMouseOver: Colors.red.basedOnLuminance(),
      iconMouseDown: Colors.red.dark.basedOnLuminance(),
    );
    return Row(children: [
      Tooltip(
        message: FluentLocalizations.of(context).minimizeWindowTooltip,
        child: MinimizeWindowButton(colors: buttonColors),
      ),
      Tooltip(
        message: FluentLocalizations.of(context).restoreWindowTooltip,
        child: WindowButton(
          colors: buttonColors,
          iconBuilder: (context) {
            if (appWindow.isMaximized) {
              return RestoreIcon(color: context.iconColor);
            }
            return MaximizeIcon(color: context.iconColor);
          },
          onPressed: appWindow.maximizeOrRestore,
        ),
      ),
      Tooltip(
        message: FluentLocalizations.of(context).closeWindowTooltip,
        child: CloseWindowButton(colors: closeButtonColors),
      ),
    ]);
  }
}
