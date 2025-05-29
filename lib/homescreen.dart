import 'package:flutter/material.dart';
import 'file_category.dart';
import 'source_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Files'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Storage information
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All files',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '76.3 GB | 256 GB',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 76.3 / 256,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),
            
            // File categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  File_Category(
                    title: 'Photos', 
                    icon: Icons.photo, 
                    count: '3362', 
                    color: Colors.purple, 
                    route: '/photos'
                  ),
                  File_Category(
                    title: 'Videos', 
                    icon: Icons.videocam, 
                    count: '102', 
                    color: Colors.red, 
                    route: '/videos'
                  ),
                  File_Category(
                    title: 'Audio', 
                    icon: Icons.music_note, 
                    count: '9', 
                    color: Colors.orange, 
                    route: '/audio'
                  ),
                  File_Category(
                    title: 'Documents', 
                    icon: Icons.description, 
                    count: '586', 
                    color: Colors.blue, 
                    route: '/documents'
                  ),
                  File_Category(
                    title: 'APKs', 
                    icon: Icons.android, 
                    count: '4', 
                    color: Colors.green, 
                    route: '/apks'
                  ),
                  File_Category(
                    title: 'Archives', 
                    icon: Icons.archive, 
                    count: '0', 
                    color: Colors.brown, 
                    route: '/archives'
                  ),
                ],
              ),
            ),
            
            Divider(height: 32),
            
            // Sources section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sources',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Source_Button(title: 'Bluetooth', icon: Icons.bluetooth),
                      Source_Button(title: 'Downloads', icon: Icons.download),
                      Source_Button(title: 'WhatsApp', icon: Icons.chat),
                      Source_Button(title: 'Quick access', icon: Icons.star),
                      Source_Button(title: 'Add folder', icon: Icons.create_new_folder),
                      Source_Button(title: 'Tag', icon: Icons.tag),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}