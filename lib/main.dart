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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /**
   * 滚动监听
   * ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件，
   *  controller.addListener(()=>print(controller.offset))
   *
   * */

   ScrollController _controller = ScrollController();
   bool showToTopBtn = false; //是否显示“返回到顶部”按钮

   @override
   void initState(){
     super.initState();
   //  监听滚动事件，打印滚动位置
     _controller.addListener(() {
       print(_controller.offset); //打印滚动位置
       if (_controller.offset < 1000 && showToTopBtn){
          setState(() {
            showToTopBtn = false;
          });
       }else if(_controller.offset >= 1000 && showToTopBtn == false){
         setState(() {
           showToTopBtn = true;
         });
       }
     });
   }

   @override
   void dispose(){
   //  为了避免内存泄露，需要调用_controller.dispose
     _controller.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听及控制"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //
      //     ],
      //   ),
      // ),
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"),);
             }
           ),
        ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
          onPressed: (){
        // 返回到顶部时执行动画
            _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
      }),
    );
  }
}
