import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:facenat_app/config/palette.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/models.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key key,
    this.isAddStory = false,
    // this.isHasBorder = false,
    this.currentUser,
    this.story,
  }) : super(key: key);
  final bool isAddStory;

  // final bool isHasBorder;
  final User currentUser;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: isAddStory ? 130 : double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        isAddStory
            ? _AddStory()
            : Stack(
                children: [
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: !story.isViewed
                              ? Border.all(
                                  width: 3.0, color: Palette.facebookBlue)
                              : null,
                          borderRadius: BorderRadius.circular(50)),
                      child: CircularProfileAvatar(
                        story.user.imageUrl,
                        borderColor: Colors.black12,
                        borderWidth: 2.0,
                        radius: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: double.infinity,
                    width: 100,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      story.user.name,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
      ],
    );
  }
}

class _AddStory extends StatelessWidget {
  const _AddStory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 70,
              width: 110.0,
              decoration: const BoxDecoration(
                color: Palette.scaffold,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12.0)),
              ),
            ),
          ),
          Positioned(
            height: 40.0,
            width: 40.0,
            bottom: 55,
            left: 55 - 40 / 2,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Palette.scaffold,
                    width: 2.0,
                  )),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Creat story',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
