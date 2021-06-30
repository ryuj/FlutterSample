import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ほげほげ")),
      body: myBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "ホーム"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "検索"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "ライブ"),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "イベント"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "マイページ"),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        // TODO: タブバーの見た目更新が必要
        onTap: (value) => {debugPrint(value.toString())},
      ),
    );
  }

  Widget myBody() {
    // GridView だけだと設定できない（高さがない？）ので Expanded で囲う
    // TODO: 厳密には PageView と GridView を両方縦スクロールしたい
    return Column(children: <Widget>[
      Expanded(child: myPageView()),
      Expanded(child: myGridView())
    ]);
  }

  Widget myPageView() {
    var imageUrlList = getImageUrlList();
    return PageView.builder(
        itemCount: imageUrlList.length,
        itemBuilder: (context, index) {
          return Image.network(imageUrlList[index]);
        });
    // return PageView(
    //   children: [
    //     Image.network(
    //         "https://1.bp.blogspot.com/-VthzAuEo8fc/X96mhYv33UI/AAAAAAABdBs/HXCc0J0WsHUMSuQ00UZ5UuLPUXatMIq-wCNcBGAsYHQ/s831/onepiece01_luffy2.png")
    //   ],
    // );
  }

  Widget myGridView() {
    // 参考：https://tech.pepabo.com/2020/05/27/flutter-hands-on/
    var imageUrlList = getImageUrlList();
    return Container(
      // GridView はウィジェットをグリッドで表示してくれるウィジェット
      // iOS UIKit で言うところの UICollectionView
      // GridView.builder という factory(カスタムコンストラクタ) で初期化する
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // グリッド横方向のウィジェット数
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            // グリッド表示するウィジェットの縦横比
            childAspectRatio: 0.7,
          ),
          itemCount: imageUrlList.length,
          // itemBuilder は GridView のインデックス毎に表示したいウィジェットを返すデリゲート
          // context, index を引数にとり、ウィジェットを返す関数を指定してやる
          // itemCont の回数だけ呼ばれる
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Image.network(imageUrlList[index]),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                overlayColor: MaterialStateProperty.all<Color>(Colors.green),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shadowColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              onPressed: () {
                debugPrint(index.toString());
              },
            );
            // とりあえずグレーのコンテナを表示してみる
            // return Container(
            //   color: Colors.grey,
            //   margin: EdgeInsets.all(16),
            // );
          }),
    );
  }

  List<String> getImageUrlList() {
    // いらすとや画像をお借りする
    return [
      "https://1.bp.blogspot.com/-VthzAuEo8fc/X96mhYv33UI/AAAAAAABdBs/HXCc0J0WsHUMSuQ00UZ5UuLPUXatMIq-wCNcBGAsYHQ/s831/onepiece01_luffy2.png",
      "https://1.bp.blogspot.com/-rzRcgoXDqEg/YAOTCKoCpPI/AAAAAAABdOI/5Bl3_zhOxm07TUGzW8_83cXMOT9yy1VJwCNcBGAsYHQ/s1041/onepiece02_zoro_bandana.png",
      "https://1.bp.blogspot.com/-2ut_UQv3iss/X-Fcs_0oAII/AAAAAAABdD8/jrCZTd_xK-Y6CP1KwOtT_LpEpjp-1nvxgCNcBGAsYHQ/s1055/onepiece03_nami.png",
      "https://1.bp.blogspot.com/-mZpzgXC1Sxk/YAOTCAKwWTI/AAAAAAABdOM/5B4hXli0KLU5N-BySHgjVbhZscKLSE-bQCNcBGAsYHQ/s1025/onepiece04_usopp_sogeking.png",
      "https://1.bp.blogspot.com/-HPG_x7XPky8/X-FctLTLkKI/AAAAAAABdEE/xs4T8m0FiBAFptXHGQhQ2c9ZmVWtaeQSgCNcBGAsYHQ/s1028/onepiece05_sanji.png",
      "https://1.bp.blogspot.com/--9Rl2O4BBN0/X-Fct8K5mqI/AAAAAAABdEI/yLOziAqJO34fwn73AolVP0e42A2h-ql1QCNcBGAsYHQ/s992/onepiece06_chopper.png",
      "https://1.bp.blogspot.com/-JiNpsjnPn7g/X-FcuWcU37I/AAAAAAABdEQ/P5r3wBMTRegjl7njCk4zWBkdoay44-T2gCNcBGAsYHQ/s1151/onepiece07_robin.png",
      "https://1.bp.blogspot.com/-H8YBA_SpxGs/X-Fcu75hh_I/AAAAAAABdEU/WRKUa03ypYor3TwvhziHAnSEcTN4Noq0gCNcBGAsYHQ/s1148/onepiece08_franky.png",
      "https://1.bp.blogspot.com/-KZ0MJgiPJHo/X__CLeY-zVI/AAAAAAABdNM/HnFYqUe0VQEzCWCqyMggibpk4kBRtFCpQCNcBGAsYHQ/s1102/onepiece09_brook.png"
    ];
  }
}

//
// サンプル実装
//

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             // 画像出してみる
//             Image.network(
//                 "https://1.bp.blogspot.com/-VthzAuEo8fc/X96mhYv33UI/AAAAAAABdBs/HXCc0J0WsHUMSuQ00UZ5UuLPUXatMIq-wCNcBGAsYHQ/s831/onepiece01_luffy2.png")
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
