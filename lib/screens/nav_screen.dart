import 'package:facenat_app/config/palette.dart';
import 'package:facenat_app/data/data.dart';
import 'package:facenat_app/draft.dart';
import 'package:facenat_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../models/models.dart';
import '../widgets/widget.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    const HomeScreen(),
    const ProfileScreen(),
    const SliverTestScreen(),
    const SliverTestScreen(),
    const SliverTestScreen(),
    const SliverTestScreen(),
  ];

  final List<IconData> _icon = [
    Icons.home,
    MdiIcons.accountCircleOutline,
    Icons.ondemand_video,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icon.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              floating: true,
              // pinned: false,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              title: const Text(
                PaletteText.appName,
                style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2),
              ),
              actions: [
                CircleButton(
                  icon: Icons.add,
                  bColor: Colors.grey[200],
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: Icons.search,
                  bColor: Colors.grey[200],
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  bColor: Colors.grey[200],
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            // SliverFillRemaining(
            //   child: _screen[_selectedIndex],
            // ),
            CustomTabBar(
              icons: _icon,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
            _screen[_selectedIndex]
          ],
        ),
      ),
    );
  }
}
