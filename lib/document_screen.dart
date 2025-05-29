import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  final List<Map<String, dynamic>> documents = const [
    {
      "name": "4th_B student List_lab and _Assignment.xlsx",
      "size": "68 KB",
      "date": "29 May",
      "icon": Icons.description,
    },
    {
      "name": "Test(Avgof2)~1.xls",
      "size": "34 KB",
      "date": "28 May",
      "icon": Icons.description,
    },
    {
      "name": "FLUTTER REPROT.pdf",
      "size": "1.3 MB",
      "date": "28 May",
      "icon": Icons.picture_as_pdf,
    },
    {
      "name": "DAA assignment~1.pdf",
      "size": "1.8 MB",
      "date": "28 May",
      "icon": Icons.picture_as_pdf,
    },
    {
      "name": "Circular-NPTEL Awareness Program.pdf",
      "size": "1.5 MB",
      "date": "28 May",
      "icon": Icons.picture_as_pdf,
    },
    {
      "name": "EDA_MODULE 5.pdf",
      "size": "1.3 MB",
      "date": "28 May",
      "icon": Icons.picture_as_pdf,
    },
    {
      "name": "20250404163158~4_EDA_Mod4_QB&soln.pdf",
      "size": "682 KB",
      "date": "27 May",
      "icon": Icons.picture_as_pdf,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documents"),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.grid_view),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          const TabBarHeader(),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index];
                return ListTile(
                  leading: Icon(
                    doc['icon'],
                    size: 32,
                    color: Colors.orangeAccent,
                  ),
                  title: Text(doc['name'],
                      style: const TextStyle(fontSize: 14)),
                  subtitle: Text("${doc['size']}  |  ${doc['date']}"),
                  onTap: () {
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          TabChip(title: "All", selected: true),
          TabChip(title: "DOC"),
          TabChip(title: "XLS"),
          TabChip(title: "PPT"),
          TabChip(title: "PDF"),
          TabChip(title: "OFD"),
          TabChip(title: "TXT"),
        ],
      ),
    );
  }
}

class TabChip extends StatelessWidget {
  final String title;
  final bool selected;

  const TabChip({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        backgroundColor:
            selected ? Colors.white : Colors.grey.shade800,
        label: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
