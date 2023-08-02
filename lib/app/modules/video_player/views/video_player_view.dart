import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/modules/video_player/controllers/video_player_controller.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';
import 'package:get/get.dart';

import 'package:chewie/chewie.dart';

class VideoPlayerView extends StatefulWidget {
  final String video;
  final String title;
  const VideoPlayerView({super.key, required this.title, required this.video});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  VideoPayerController controller = Get.put(VideoPayerController());

  @override
  void initState() {
    super.initState();
    controller.intiallizePlayer(widget.video, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, widget.title.toUpperCase()),
      body: GetBuilder<VideoPayerController>(
        init: VideoPayerController(),
        builder: (controller) {
          return controller.chewieController != null && controller.chewieController!.videoPlayerController.value.isInitialized
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Chewie(controller: controller.chewieController!),
                )
              : loading();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.intiallizePlayer(widget.video, context);
  }
}
