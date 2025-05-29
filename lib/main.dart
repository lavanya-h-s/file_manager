import 'package:flutter/material.dart';

void main() {
  runApp(const FileManagerApp());
}

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      routes: {
        '/photos': (context) => const PhotosScreen(),
        '/videos': (context) => const VideosScreen(),
        '/documents': (context) => const DocumentsScreen(),
        '/audio': (context) => const AudioScreen(),
        '/apks': (context) => const APKsScreen(),
        '/archives': (context) => const ArchivesScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Storage information
            const Padding(
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
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),

            // File categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildFileCategory(context, 'Photos', Icons.photo, '3362', Colors.purple, '/photos'),
                  _buildFileCategory(context, 'Videos', Icons.videocam, '102', Colors.red, '/videos'),
                  _buildFileCategory(context, 'Audio', Icons.music_note, '9', Colors.orange, '/audio'),
                  _buildFileCategory(context, 'Documents', Icons.description, '586', Colors.blue, '/documents'),
                  _buildFileCategory(context, 'APKs', Icons.android, '4', Colors.green, '/apks'),
                  _buildFileCategory(context, 'Archives', Icons.archive, '0', Colors.brown, '/archives'),
                ],
              ),
            ),

            const Divider(height: 32),

            // Sources section
            const Padding(
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
                      SourceButton(title: 'Bluetooth', icon: Icons.bluetooth),
                      SourceButton(title: 'Downloads', icon: Icons.download),
                      SourceButton(title: 'WhatsApp', icon: Icons.chat),
                      SourceButton(title: 'Quick access', icon: Icons.star),
                      SourceButton(title: 'Add folder', icon: Icons.create_new_folder),
                      SourceButton(title: 'Tag', icon: Icons.tag),
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

  Widget _buildFileCategory(BuildContext context, String title, IconData icon, String count, Color color, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(
              count,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class SourceButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const SourceButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(title),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $title')),
        );
      },
    );
  }
}

// Screen classes
class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos (3362)')),
      body: const Center(child: Text('All your photos would appear here')),
    );
  }
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos (102)')),
      body: const Center(child: Text('All your videos would appear here')),
    );
  }
}

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documents (586)')),
      body: const Center(child: Text('All your documents would appear here')),
    );
  }
}

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio (9)')),
      body: const Center(child: Text('All your audio files would appear here')),
    );
  }
}

class APKsScreen extends StatelessWidget {
  const APKsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('APKs (4)')),
      body: const Center(child: Text('All your APK files would appear here')),
    );
  }
}

class ArchivesScreen extends StatelessWidget {
  const ArchivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Archives (0)')),
      body: const Center(child: Text('All your archive files would appear here')),
    );
  }
}