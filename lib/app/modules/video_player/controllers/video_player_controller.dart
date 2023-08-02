import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPayerController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> intiallizePlayer(video, context) async {
    videoPlayerController = VideoPlayerController.network(video!);
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      placeholder: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      autoInitialize: true,
      showOptions: false,
    );
    update();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    // chewieController!.dispose();
  }
}
