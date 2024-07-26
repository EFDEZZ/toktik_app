// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:toktik_app/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;

  const FullscreenPlayer({
    super.key, 
    required this.caption, 
    required this.videoUrl});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
    .. setVolume(0)
    .. setLooping(true)
    .. play();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
        return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                //Gradiente
                const VideoBackground(),
          
          
          
                //Texto
                Positioned(
                  bottom: 50,
                  left: 40,
                  child: _VideoCaption(caption: widget.caption)
                  )
              ],
            )
            ),
        );
      },);
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final titleStlye = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size*0.6,
      child: Text(caption, maxLines: 2, style: titleStlye,),
      
    );
  }
}

