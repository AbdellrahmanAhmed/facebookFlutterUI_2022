import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  // backgroundImage: NetworkImage(currentUser.imageUrl) == null
                  //     ? AssetImage(currentUser.imagePath)
                  //     : NetworkImage(currentUser.imageUrl),
                  backgroundImage: AssetImage(currentUser.imagePath),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Expanded(
                  child: SizedBox(
                    // width: 300,
                    height: 35,
                    child: Expanded(
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            hintText: 'what\'s on your mind?'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18.0,
                ),
                ButtonTheme(
                    child: const Icon(
                  Icons.photo_library_sharp,
                  color: Colors.green,
                ))
              ],
            ),
          ]),
    );
  }
}
