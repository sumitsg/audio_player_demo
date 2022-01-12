import 'package:audio_player_demo/tabs/assets_tab.dart';
import 'package:audio_player_demo/tabs/locale_tab.dart';
import 'package:audio_player_demo/tabs/remote_tabs.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({Key? key}) : super(key: key);

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
              labelPadding: EdgeInsets.zero,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Assets',
                ),
                Tab(
                  text: 'Local',
                ),
                Tab(
                  text: 'Remote',
                ),
              ]),
        ),
        body: const TabBarView(children: [
          AssetsTab(),
          LocaleTabs(),
          RemoteTabs(),
        ]),
      ),
    );
  }
}
