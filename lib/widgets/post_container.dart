import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/models.dart';

class PostContainer extends StatelessWidget {
  PostContainer({
    Key key,
    @required this.post,
    this.story,
  }) : super(key: key);
  final Post post;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post, story: story),
                const SizedBox(
                  height: 8.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key key,
    @required this.post,
    this.story,
  }) : super(key: key);
  final Post post;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Palette.facebookBlue, width: 3.0),
              borderRadius: BorderRadius.circular(50)),
          child: CircleAvatar(
            child: CircularProfileAvatar(
              post.user.imageUrl,
              borderColor: Colors.white,
              borderWidth: story.imageUrl != null ? 2.0 : 0.0,
              radius: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('${post.timeAgo} • '),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_rounded,
              color: Colors.grey[600],
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.grey[600],
            )),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const _Reaction(
              color: Palette.facebookBlue,
              icon: Icons.thumb_up,
            ),
            const SizedBox(
              width: 1.0,
            ),
            const _Reaction(
              color: Colors.red,
              icon: Icons.favorite,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.likes}',
            ),
            const Spacer(),
            Text(
              '${post.comments} Comments • ',
            ),
            Text(
              '${post.shares} Shares ',
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _PostButton(
              onTap: () {},
              icon: MdiIcons.thumbUpOutline,
              label: 'Like ',
            ),
            _PostButton(
              onTap: () {},
              icon: MdiIcons.commentOutline,
              label: 'Comment  ',
            ),
            _PostButton(
              onTap: () {},
              icon: MdiIcons.shareOutline,
              label: 'Share ',
            ),
          ],
        )
      ],
    );
  }
}

class _Reaction extends StatelessWidget {
  const _Reaction({
    Key key,
    @required this.color,
    @required this.icon,
  }) : super(key: key);

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 10.0,
        color: Colors.white,
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.onTap})
      : super(key: key);

  final IconData icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
                children: [
              Icon(
                icon,
                color: Colors.grey[600],
                size: 25.0,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(label)
            ]),
          )),
    );
  }
}
