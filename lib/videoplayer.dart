import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key key, this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _videoplayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null) {
      _videoplayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      _initializeVideoPlayerFuture = _videoplayerController.initialize().then((_) {
        _videoplayerController.play();
        _videoplayerController.setLooping(true);
        if (mounted) {
          setState(() {});
        }
      });
    } else {
      print("Error: La URL del video es nula.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(

            child: AspectRatio(
              aspectRatio: _videoplayerController.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_videoplayerController),
                  VideoProgressIndicator(_videoplayerController, allowScrubbing: true),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    _videoplayerController.dispose();
    super.dispose();
  }
}