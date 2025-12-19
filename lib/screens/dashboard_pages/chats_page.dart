import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final int _selectedIndex = 0; // Selected nav index
  String searchText = "";

  // Example chat data
  final List<Map<String, dynamic>> chats = [
    {"avatar": "S", "name": "Sujal Gauchan", "message": "Lets meet today", "badge": 3, "time": DateTime.now().subtract(const Duration(hours: 1))},
    {"avatar": "A", "name": "Anisha", "message": "Sent you files", "time": DateTime.now().subtract(const Duration(hours: 3))},
    {"avatar": "R", "name": "Rajan", "message": "Are you free?", "time": DateTime.now().subtract(const Duration(days: 1))},
    {"avatar": "M", "name": "Mina", "message": "Check this link", "time": DateTime.now().subtract(const Duration(days: 2))},
    {"avatar": "K", "name": "Kiran", "message": "Good morning!", "time": DateTime.now().subtract(const Duration(hours: 6))},
    {"avatar": "P", "name": "Pooja", "message": "Let's catch up", "time": DateTime.now().subtract(const Duration(minutes: 30))},
    {"avatar": "D", "name": "Dinesh", "message": "Meeting at 3 PM", "time": DateTime.now().subtract(const Duration(hours: 2))},
    {"avatar": "T", "name": "Tina", "message": "Happy Birthday!", "time": DateTime.now().subtract(const Duration(days: 3))},
    {"avatar": "S", "name": "Samir", "message": "Can you call me?", "time": DateTime.now().subtract(const Duration(minutes: 15))},
    {"avatar": "L", "name": "Laxmi", "message": "Project update needed", "time": DateTime.now().subtract(const Duration(hours: 4))},
  ];

  void _showModal(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  String formatTime(DateTime time) {
    final now = DateTime.now();
    if (time.day == now.day && time.month == now.month && time.year == now.year) {
      return DateFormat.jm().format(time); // e.g., 10:45 AM
    } else if (time.day == now.subtract(const Duration(days: 1)).day) {
      return "Yesterday";
    } else {
      return DateFormat('MMM d').format(time); // e.g., Dec 18
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter chats based on search text
    final filteredChats = chats.where((chat) {
      return chat["name"].toLowerCase().contains(searchText.toLowerCase()) ||
          chat["message"].toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF81EEFF),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () =>
                  _showModal("New Friend", "Search username or number"),
              backgroundColor: const Color.fromARGB(255, 93, 165, 237),
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Filter Chips
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FilterChip(label: const Text("All"), selected: true, onSelected: (_) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text("Favourite"), selected: false, onSelected: (_) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text("Unseen"), selected: false, onSelected: (_) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text("+"), selected: false, onSelected: (_) {}),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // Chat List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ChatCard(
                  avatarText: chat["avatar"],
                  name: chat["name"],
                  message: chat["message"],
                  badgeCount: chat["badge"],
                  time: formatTime(chat["time"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String avatarText;
  final String name;
  final String message;
  final int? badgeCount;
  final String time;

  const ChatCard({
    super.key,
    required this.avatarText,
    required this.name,
    required this.message,
    this.badgeCount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                avatarText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Chat info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(message,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              if (badgeCount != null)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2575fc),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
