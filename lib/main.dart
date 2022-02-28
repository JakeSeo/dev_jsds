import 'package:dev_jsds/common/ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'dev.jsds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'dev.jsds'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  double _welcomePageOpacity = 1.0;
  double _welcomePageLogoSize = 48;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("offset = ${_scrollController.offset}");
      setState(() {
        _welcomePageOpacity = _getCurrentOpacity();
        _welcomePageLogoSize =
            48 - (_scrollController.offset * 2 / UI().screenHeight) * 24;
      });
    });
  }

  double _getCurrentOpacity() {
    if (!_scrollController.hasClients) return 1.0;

    double opacity = 1 - (_scrollController.offset * 2) / UI().screenHeight;
    if (opacity < 0) {
      return 0.0;
    }

    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    UI().setContext(context);
    double height = UI().screenHeight;
    print("height: ${MediaQuery.of(context).size.height} $height");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Center(
          child: Container(
            height: kToolbarHeight,
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UI().generateWidth(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "dev.jsds",
                    style: TextStyle(
                      color: Colors.white.withOpacity(1 - _welcomePageOpacity),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "English",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 24),
                      Text(
                        "한국어",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: UI().generateWidth(10),
                ),
                height: UI().generateHeight(100),
                color: Colors.blue,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: UI().generateWidth(40),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            Text(
                              "dev.jsds",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: _welcomePageLogoSize,
                              ),
                            ),
                            Text(
                              "에 오신것을 환영합니다.",
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(_welcomePageOpacity),
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              "저는 소프트웨어 엔지니어,",
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(_welcomePageOpacity),
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              "서동성입니다.",
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(_welcomePageOpacity),
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              "잘 부탁드리겠습니다.",
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(_welcomePageOpacity),
                                fontSize: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: UI().generateHeight(40),
                        width: UI().generateWidth(30),
                        color: Colors.grey.withOpacity(_welcomePageOpacity),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: UI().generateHeight(100),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
