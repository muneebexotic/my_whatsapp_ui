import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('WhatsApp'),
              backgroundColor: Colors.teal,
              actions: [
                const Icon(Icons.search),
                const SizedBox(
                  width: 10,
                ),
                PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (
                      context,
                    ) =>
                        [
                          const PopupMenuItem(
                              value: '1', child: Text('New Group')),
                          const PopupMenuItem(
                              value: '1', child: Text('Settings')),
                          const PopupMenuItem(
                              value: '1', child: Text('Layout')),
                        ]),
                const SizedBox(
                  width: 10,
                ),
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Icon(Icons.camera_alt),
                  ),
                  Tab(
                    child: badges.Badge(
                      badgeContent: Text('3'),
                      badgeAnimation: badges.BadgeAnimation.fade(
                          //animationDuration: Duration(seconds: 20),
                          loopAnimation: true),
                      child: Text('Chats'),
                    ),
                  ),
                  Tab(
                    child: Text('Status'),
                  ),
                  Tab(child: Text('Calls'))
                ],
              ),
            ),
            body: TabBarView(children: [
              const Text('Camera'),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: Text("Ada"),
                      subtitle: Text("where are you?"),
                      trailing: Text("12:46 PM"),
                    );
                  }),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 3)),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                      title: const Text("Ada"),
                      subtitle: Text(index / 2 == 0 ? "5:02 pm" : "Yesterday"),
                    );
                  }),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: const Text("Ada"),
                      subtitle: Text(index / 2 == 0
                          ? "Yesterday, 5:02 pm"
                          : "Today, 9:11 am"),
                      trailing:
                          Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ])));
  }
}
