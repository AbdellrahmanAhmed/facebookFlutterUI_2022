import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../widgets/widget.dart';

class DRAFT extends StatelessWidget {
  const DRAFT({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          backgroundColor: Colors.white,
          pinned: true,
          toolbarHeight: 60,
          actions: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleButton(
                        icon: Icons.home,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: MdiIcons.bellOutline,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: Icons.people_outline,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: Icons.live_tv_sharp,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: Icons.manage_accounts,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: Icons.menu,
                        color: Colors.grey,
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(
                    height: 3.0,
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SliverTestScreen extends StatelessWidget {
  const SliverTestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: const [
      SliverFillRemaining(
        child: Center(child: Text('Screen ')),
      )
    ]);
  }
}
