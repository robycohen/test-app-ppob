import 'package:flutter/material.dart';
import 'package:ppob/core/base/build_config.dart';
import 'package:ppob/features/home/home_menu_screen.dart';
import 'package:ppob/ppob_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          brightness: Brightness.light,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFFF0018),
        ),
      ),
      home: const MyHomePage(title: 'Bpr indra ppob test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _baseUrlProd = "http://online.bprindra.com:29012/";
  String _baseUrlDev = "http://online.bprindra.com:19012/";
  String _secretKey = "a8eeea6c3c839d8b96a8a1a43a13e5c3";
  String _rsaKey =
      "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDr/Wj9Qwsu/e5rqh0V4M909gPjKN5/woboOVD/jtlfEwAbUke/giXEyT9onqlsMYQeFgO5f9z1Z2Ce7WKCdZawi+p0fohzULrPcxGlsOC4GjBOHinsP5L/axUj3hX0mtVJ6TsWNIyKT02A+fJ9xBy62qS3Xo2773Cppt5APQYv8wIDAQAB";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PPOBModule.init(
      buildConfig: () => PPOBBuildConfig(
          baseUrl: _baseUrlDev,
          rsaKey: _rsaKey,
          secretKey: _secretKey,
          sessionId: "",
          cif: "",
          debug: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MenuPPOBScreen(
                            noRekening: "1212121212",
                          )));
                },
                child: Text("PPOB Menu")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
