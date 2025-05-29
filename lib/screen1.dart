import 'package:flutter/material.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  Widget buildCategory(String label, IconData icon, int count, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color.withValues(),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          '$count',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        ),
      ],
    );
  }

  Widget buildSource(String label, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {}, // Define navigation or functionality here
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Storage Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("All files", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  const Text(
                    "76.3 GB",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("of 256 GB", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 76.3 / 256,
                    backgroundColor: Colors.grey.shade800,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                buildCategory("Photos", Icons.image, 3362, Colors.blue),
                buildCategory(
                  "Videos",
                  Icons.video_collection,
                  102,
                  Colors.deepPurple,
                ),
                buildCategory("Audio", Icons.music_note, 9, Colors.orange),
                buildCategory(
                  "Documents",
                  Icons.description,
                  586,
                  Colors.lightBlue,
                ),
                buildCategory("APKs", Icons.android, 4, Colors.green),
                buildCategory("Archives", Icons.archive, 0, Colors.brown),
              ],
            ),
            const SizedBox(height: 30),

            // Sources
            const Text(
              "Sources",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildSource("Bluetooth", Icons.bluetooth, Colors.blue),
            buildSource("Downloads", Icons.download, Colors.green),

            //buildSource("WhatsApp", Icons.whatsapp, Colors.greenAccent),
            const SizedBox(height: 20),
            const Text(
              "Quick access",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Add folder
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text("Add folder"),
              onTap: () {}, // Define folder addition logic here
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action logic here
        },
        child: const Icon(Icons.cleaning_services),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Recent',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
        ],
      ),
    );
  }
}
