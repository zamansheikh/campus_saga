import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:campus_saga/core/constants/update_constants.dart';
import 'package:campus_saga/core/injection_container.dart';
import 'package:campus_saga/core/services/update_checker.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_bloc.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_event.dart';
import 'package:campus_saga/presentation/pages/home/issue_page.dart';
import 'package:campus_saga/presentation/pages/home/switcher_widget.dart';
import 'package:campus_saga/presentation/pages/post/create_post_page.dart';
import 'package:campus_saga/presentation/pages/profile/profile_page.dart';
import 'package:campus_saga/presentation/pages/promotion/promotion_page.dart';
import 'package:campus_saga/presentation/pages/ranking/ranking_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentVersion = CURRENT_VERSION;
  int _currentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      IssuePage(),
      PromotionPage(),
      CreatePostPage(
        onPostCreated: (index) {
          setState(() {
            _currentIndex = index; // Navigate to IssuePage
          });
        },
      ),
      RankingPage(),
      ProfilePage(),
    ];
    Future.delayed(Duration(seconds: 5), () async {
      _currentVersion = await checkUpdateFromGithub(context);
      setState(() {
        _currentVersion = _currentVersion;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpen) {
        if (isOpen) {
          FocusScope.of(context)
              .unfocus(); // Dismiss keyboard when drawer opens
        }
      },
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.school,
                          size: 40,
                        )),
                    const SizedBox(height: 10),
                    const Text(
                      'Campus Saga',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation Items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _currentIndex == 0,
              onTap: () {
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Promotion'),
              selected: _currentIndex == 1,
              onTap: () {
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Post'),
              selected: _currentIndex == 2,
              onTap: () {
                setState(() => _currentIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.leaderboard),
              title: const Text('Ranking'),
              selected: _currentIndex == 3,
              onTap: () {
                setState(() => _currentIndex = 3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: _currentIndex == 4,
              onTap: () {
                setState(() => _currentIndex = 4);
                Navigator.pop(context);
              },
            ),
            // Switch Campus
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Switch Campus'),
              onTap: () {
                Navigator.pop(context);
                showSwitcherWidget(context);
              },
            ),
            //about app
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About App'),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: 'Campus Saga',
                  applicationVersion: CURRENT_VERSION,
                  applicationIcon: const Icon(Icons.school),
                  applicationLegalese: '© 2024 Campus Saga',
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Campus Saga is a platform for students to share their thoughts, ideas, and feedback with their campus community.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Developed by: deCoders Family',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),

            const Spacer(),
            const Divider(),

            // Bottom Actions
            ListTile(
              leading: const Icon(Icons.system_update),
              title: Text(
                  '${CURRENT_VERSION == _currentVersion ? 'Up to date' : '$_currentVersion'}'),
              onTap: () {
                checkUpdateFromGithub(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                'Logout',
              ),
              onTap: () async {
                sl<AuthBloc>().add(SignOutEvent());
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AdvancedSalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.campaign),
            title: Text(
              "Promotions",
              style: TextStyle(fontSize: 12),
            ),
            selectedColor: Colors.pink,
          ),

          /// Search
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text("Add Post"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Rankings"),
            selectedColor: Colors.teal,
          ),

          /// Profile
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
