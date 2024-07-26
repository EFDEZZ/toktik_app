import 'package:toktik_app/domain/entities/video_post.dart';

/* Se ponen los mismos nombres que entran por la api para que sirvan para hacer una union de las respuestas de la api
con la aplicacion  */
/* Viene siendo la estructura de los datos de la respuesta de la api */
class LocalVideoModel{
  final String name;
  final String videoUrl;
  final int likes;
  final int views
  ;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes=0, 
    this.views=0
    });

    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
      name: json["name"], 
      videoUrl: json["videoUrl"],
      likes: json["likes"],
      views: json["views"],
      );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views,
    );
}
