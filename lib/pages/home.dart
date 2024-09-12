import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lorysapp/pages/login.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/lorys-app.appspot.com/o/fyp%2Fchezka1.mp4?alt=media&token=366053c9-3397-4ee0-a4df-ceb9c52ca2ce");
    // https://labex-wfuoqqcqxo.oss-us-west-1.aliyuncs.com/labex-imgs/y2mate.com%20-%20%23%ED%95%9C%EC%9D%BC%ED%86%B1%ED%85%90%EC%87%BC%20%23%EC%B9%B4%EB%85%B8%EC%9A%B0%EB%AF%B8%EC%9C%A0%20%23%EC%A7%80%EC%A7%80%EB%A7%90%EC%95%84%EC%9A%94%5B7405452225759235335-h264_540p_611078-0%5D.mp4
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.initialize().then((_) => {setState(() {})});
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
            actions: [],
            leading: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }))
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                      'assets/svg/arrow-left-svgrepo-com.svg')),
            ),
            centerTitle: true,
            title: Text('Following | For You',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
        body: Center(
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  return _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller))
                      : Center(child: CircularProgressIndicator());
                })));
  }
}
