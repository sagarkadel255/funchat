import 'package:flutter/material.dart';
import 'dashboard_pages/chats_page.dart';
import 'dashboard_pages/calls_page.dart';
import 'dashboard_pages/settings_page.dart';
import 'dashboard_pages/profile_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _pages = const [
    ChatsPage(),     
    CallsPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showModal(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81EEFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6fdcff),
        title: const Text("Funchat"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showModal("Menu", "New Group\nArchived\nLogout"),
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () =>
                  _showModal("New Friend", "Search username or number"),
              backgroundColor: const Color.fromARGB(255, 93, 165, 237),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
