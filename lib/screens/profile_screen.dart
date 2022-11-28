import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:facenat_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.black,
                  height: 250,
                  child: CachedNetworkImage(imageUrl: currentUser.profileUrl),
                ),
                const SizedBox(
                  height: 78.0,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser.name,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '''
"الوقت لوقتہ"
"قلہ ذات اليد هي رأس كل خطيئہ"
"إقرأ فنحن أمہ إقرأ"
"عمل يجہد خير من فراغ يفسد"
                            ''',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const _Music(),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'ELLY Medayea Yefarea',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text('Assala')
                                    ],
                                  ),
                                )),
                                Icon(Icons.more_horiz_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                _noShadowButtonIcon(
                                  icon: Icons.add,
                                  iconColor: Colors.white,
                                  textColor: Colors.white,
                                  backgroundColor: Palette.facebookBlue,
                                  lable: 'Add to Story',
                                ),
                                _noShadowButtonIcon(
                                  icon: MdiIcons.pencil,
                                  textColor: Colors.black,
                                  backgroundColor:
                                      Color.fromRGBO(240, 242, 245, 1),
                                  lable: 'Edit Profile',
                                ),
                                _noShadowButtonIcon(
                                  icon: Icons.more_horiz_rounded,
                                  backgroundColor:
                                      Color.fromRGBO(240, 242, 245, 1),
                                ),
                              ],
                            )
                          ])),
                ),
              ],
            ),
            Positioned(
                left: 20.0,
                top: 115,
                child: CircularProfileAvatar(
                  currentUser.imageUrl,
                  radius: 100,
                  borderColor: Palette.scaffold,
                  borderWidth: 5.0,
                ))
          ],
        ),
      ),
    );
  }
}

class _noShadowButtonIcon extends StatelessWidget {
  const _noShadowButtonIcon({
    Key key,
    this.icon,
    this.backgroundColor,
    this.lable,
    this.textColor,
    this.iconColor = Colors.black,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final String lable;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 0.0, backgroundColor: backgroundColor),
      onPressed: () {},
      icon: Icon(
        icon,
        color: iconColor,
      ),
      //icon data for elevated button
      label: lable != null
          ? Text(
              lable,
              style: TextStyle(color: textColor),
            )
          : SizedBox.shrink(), //label text
    );
  }
}

class _Music extends StatelessWidget {
  const _Music({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Image.asset('lib/photos/asala.jpg', width: 50.0),
        ),
        const SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 40.0,
              ),
            )),
      ],
    );
  }
}
