import 'package:flutter/material.dart';
import 'package:flutter_clock_app/myPainter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Custom painting'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  /*AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 160));
    _animationController.forward();
    super.initState();
  }*/
  double _circleAnim = 0.0;
  Animation<double> circleAnim;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync:  this, duration: Duration(seconds: 2));
    circleAnim = Tween(begin: 0.0, end: 150.0).animate(_controller)..addListener((){
      setState(() {
        _circleAnim = circleAnim.value;
      });
    });

    _controller.repeat(reverse: true, period: Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: /*Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.red,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext ctx, Widget widget){
                        return CustomPaint(
                          painter: NoiceBox(
                            heigth: 200,
                            width: 200,
                          ),
                        );
                      },
                    )
                  ),
                ),*/
                Container(
                    height: 300,
                    width: 300,
                    color: Colors.red,
                    child: CustomPaint(
                          painter: NoiceBox(
                            x_axis: _circleAnim
                          ),
                    ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    color: Colors.blue,
                    width: 300,
                    height: 300,
                    child: CustomPaint(
                      painter: Mypainter(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
