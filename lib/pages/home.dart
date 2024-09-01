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

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
