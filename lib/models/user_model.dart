import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl;
  final String imagePath;
  final String imageStoryUrl;
  final String profileUrl;

  const User({
    @required this.name,
    this.imagePath,
    this.imageUrl,
    this.imageStoryUrl,
    this.profileUrl,
  });
}
