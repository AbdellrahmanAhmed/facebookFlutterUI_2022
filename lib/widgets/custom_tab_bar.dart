import 'package:facenat_app/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key key,
      @required this.icons,
      this.selectedIndex = 5,
      @required this.onTap })
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      backgroundColor: Colors.white,
      pinned: true,
      toolbarHeight: 60,
      actions: [
        Expanded(
          child: TabBar(
            onTap: onTap,
            indicatorPadding: EdgeInsets.zero,

            indicator: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Palette.facebookBlue,
              width: 3.0,

            ))),
            tabs: icons
                .asMap()
                .map((i, e) => MapEntry(
                      i ,
                      Tab(
                        icon: Icon(
                          e,
                          color: i == selectedIndex
                              ? Palette.facebookBlue
                              : Colors.black45,
                        ),
                      ),
                    ))
                .values
                .toList(),
          ),
        )
      ],
    );
  }
}
