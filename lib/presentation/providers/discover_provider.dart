import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostRepository videosRespository;

  DiscoverProvider({required this.videosRespository});

  Future<void> loadNextPage() async{
    await Future.delayed(const Duration(seconds: 2));

/*     final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
      ).toList(); */
    final newVideos =  await videosRespository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }

}