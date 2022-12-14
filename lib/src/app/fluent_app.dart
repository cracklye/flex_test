import 'package:flex_test/src/widgets/test_tool_bar.dart';
import 'package:flex_test/src/widgets/test_widget_fluent.dart';
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_launcher/link.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:window_manager/window_manager.dart';

const String appTitle = 'Fluent UI Showcase for Flutter';

class AppFluent extends StatelessWidget {
  const AppFluent({Key? key}) : super(key: key);
//TestPageWidgetFluent
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: appTitle,
      // themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      home: NavigationView(
        content: TestPageWidgetFluent(),
        appBar: NavigationAppBar(
          actions: TestToolBar(),
          title: Text("Windows App"),
        ),
        pane: NavigationPane(displayMode: PaneDisplayMode.compact,
            //size: NavigationPaneSize(compactWidth: 0,  openWidth: 0),
            items: [
              PaneItem(icon: Icon(FluentIcons.home), title: Text("Home")),
              // PaneItem(
              //     icon: Icon(FluentIcons.insert),
              //     title: Text("Insert")
              // ),
              // PaneItem(
              //     icon: Icon(FluentIcons.view),
              //     title: Text("View")
              // )
            ]),
      ),

      // NavigationView(
      //     //key: viewKey,
      //     appBar: NavigationAppBar(
      //       automaticallyImplyLeading: false,
      //       title: () {
      //         if (kIsWeb) return const Text(appTitle);
      //         return const DragToMoveArea(
      //           child: Align(
      //             alignment: AlignmentDirectional.centerStart,
      //             child: Text(appTitle),
      //           ),
      //         );
      //       }(),
      //       actions: kIsWeb
      //           ? null
      //           : Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: const [Spacer(), WindowButtons()],
      //             ),
      //     ),
      //     pane: NavigationPane(items:[
      //       const TestPageWidgetFluent(),
      //     ]
      //     )),

      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 24)),
      // darkTheme: ThemeData(
      //     scaffoldBackgroundColor: Colors.black,
      //     accentColor: Colors.blue,
      //     iconTheme: const IconThemeData(size: 24)),
      // builder: (context, child) {
      //   return child!;
      // }
    );
  }
}

class AppFluent2 extends StatelessWidget {
  const AppFluent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
        title: appTitle,
        // themeMode: appTheme.mode,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            accentColor: Colors.blue,
            iconTheme: const IconThemeData(size: 24)),
        darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            accentColor: Colors.blue,
            iconTheme: const IconThemeData(size: 24)),
        // color: appTheme.color,
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        //   accentColor: appTheme.color,
        //   visualDensity: VisualDensity.standard,
        //   focusTheme: FocusThemeData(
        //     glowFactor: is10footScreen() ? 2.0 : 0.0,
        //   ),
        // ),
        // theme: ThemeData(
        //   accentColor: appTheme.color,
        //   visualDensity: VisualDensity.standard,
        //   focusTheme: FocusThemeData(
        //     glowFactor: is10footScreen() ? 2.0 : 0.0,
        //   ),
        // ),
        builder: (context, child) {
          return child!;
        });

    // return ChangeNotifierProvider(
    //   create: (_) => AppTheme(),
    //   builder: (context, _) {
    //     final appTheme = context.watch<AppTheme>();
    //     return FluentApp(
    //       title: appTitle,
    //       // themeMode: appTheme.mode,
    //       debugShowCheckedModeBanner: false,
    //       home: const MyHomePage(),
    //       // color: appTheme.color,
    //       // darkTheme: ThemeData(
    //       //   brightness: Brightness.dark,
    //       //   accentColor: appTheme.color,
    //       //   visualDensity: VisualDensity.standard,
    //       //   focusTheme: FocusThemeData(
    //       //     glowFactor: is10footScreen() ? 2.0 : 0.0,
    //       //   ),
    //       // ),
    //       // theme: ThemeData(
    //       //   accentColor: appTheme.color,
    //       //   visualDensity: VisualDensity.standard,
    //       //   focusTheme: FocusThemeData(
    //       //     glowFactor: is10footScreen() ? 2.0 : 0.0,
    //       //   ),
    //       // ),
    //       builder: (context, child) {
    //        return child!;
    //        return Directionality(
    //           textDirection: appTheme.textDirection,
    //           child: NavigationPaneTheme(
    //             data: NavigationPaneThemeData(
    //               backgroundColor: appTheme.windowEffect !=
    //                       flutter_acrylic.WindowEffect.disabled
    //                   ? Colors.transparent
    //                   : null,
    //             ),
    //             child: child!,
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  bool value = false;

  int index = 0;

  final settingsController = ScrollController();
  final viewKey = GlobalKey();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    settingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final appTheme = context.watch<AppTheme>();
    return NavigationView(
        key: viewKey,
        appBar: NavigationAppBar(
          automaticallyImplyLeading: false,
          title: () {
            if (kIsWeb) return const Text(appTitle);
            return const DragToMoveArea(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(appTitle),
              ),
            );
          }(),
          actions: kIsWeb
              ? null
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [Spacer(), WindowButtons()],
                ),
        ),
        pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() => index = i),
          size: const NavigationPaneSize(
            openMinWidth: 250,
            openMaxWidth: 320,
          ),
          header: Container(
            height: kOneLineTileHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FlutterLogo(
                // style: appTheme.displayMode == PaneDisplayMode.top
                //     ? FlutterLogoStyle.markOnly
                //     : FlutterLogoStyle.horizontal,
                // size: appTheme.displayMode == PaneDisplayMode.top ? 24 : 100.0,
                ),
          ),
          //displayMode: appTheme.displayMode,
          // indicator: () {
          //   switch (appTheme.indicator) {
          //     case NavigationIndicators.end:
          //       return const EndNavigationIndicator();
          //     case NavigationIndicators.sticky:
          //     default:
          //       return const StickyNavigationIndicator();
          //   }
          // }(),
          items: [
            // It doesn't look good when resizing from compact to open
            // PaneItemHeader(header: Text('User Interaction')),
            PaneItem(
              icon: const Icon(FluentIcons.checkbox_composite),
              title: const Text('Inputs'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.text_field),
              title: const Text('Forms'),
            ),
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.color),
              title: const Text('Colors'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.icon_sets_flag),
              title: const Text('Icons'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.plain_text),
              title: const Text('Typography'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.cell_phone),
              title: const Text('Mobile'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.toolbox),
              title: const Text('Command bars'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.pop_expand),
              title: const Text('Flyouts'),
            ),
            PaneItem(
              icon: Icon(FluentIcons.more
                  // appTheme.displayMode == PaneDisplayMode.top
                  //     ? FluentIcons.more
                  //     : FluentIcons.more_vertical,
                  ),
              title: const Text('Others'),
              infoBadge: const InfoBadge(
                source: Text('9'),
              ),
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
              title: const Text('Settings'),
            ),
            _LinkPaneItemAction(
              icon: const Icon(FluentIcons.open_source),
              title: const Text('Source code'),
              link: 'https://github.com/bdlukaa/fluent_ui',
            ),
          ],
        ),
        content: TestToolBar()
        // NavigationBody(index: index, children: [
        //   const InputsPage(),
        //   const Forms(),
        //   const ColorsPage(),
        //   const IconsPage(),
        //   const TypographyPage(),
        //   const Mobile(),
        //   const CommandBars(),
        //   const FlyoutShowcase(),
        //   const Others(),
        //   Settings(controller: settingsController),
        //]
        //),
        );
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirm close'),
            content: const Text('Are you sure you want to close this window?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _LinkPaneItemAction extends PaneItem {
  _LinkPaneItemAction({
    required Widget icon,
    required this.link,
    title,
    infoBadge,
    focusNode,
    autofocus = false,
  }) : super(
          icon: icon,
          title: title,
          infoBadge: infoBadge,
          focusNode: focusNode,
          autofocus: autofocus,
        );

  final String link;

  @override
  Widget build(
    BuildContext context,
    bool selected,
    VoidCallback? onPressed, {
    PaneDisplayMode? displayMode,
    bool showTextOnTop = true,
    bool? autofocus,
  }) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) => super.build(
        context,
        selected,
        followLink,
        displayMode: displayMode,
        showTextOnTop: showTextOnTop,
        autofocus: autofocus,
      ),
    );
  }
}
