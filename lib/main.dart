import 'package:flutter/material.dart';

void main() {
  runApp(const SearchEngine());
}

class SearchEngine extends StatelessWidget {
  const SearchEngine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SearchEngine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  // Knowledge base entirely in Dart
  final Map<String, String> knowledgeBase = {
    "flutter": "Flutter is Google’s toolkit for building natively compiled apps for mobile, web, and desktop.",
    "kotlin": "Kotlin is a concise, modern language for Android and JVM.",
    "ai": "Artificial Intelligence enables machines to simulate human intelligence.",
    "search engine": "A search engine helps users find and retrieve information efficiently.",
    "dart": "Dart is the programming language used to develop Flutter apps.",
    "firebase": "Firebase is a platform developed by Google for creating mobile and web applications.",
    "widget": "A widget is a basic building block of the Flutter UI.",
    "state management": "State management refers to the way Flutter apps handle and update UI data.",
    "api": "API stands for Application Programming Interface, which allows applications to communicate.",
    "http": "HTTP is a protocol used for sending and receiving data over the web.",
    "json": "JSON is a lightweight format for exchanging data, often used with APIs.",
    "database": "A database is a structured way to store and retrieve data.",
    "machine learning": "Machine learning is a subset of AI focused on teaching machines to learn from data.",
    "neural network": "A neural network is a computational model inspired by the human brain, used in AI.",
    "ui design": "UI design is the process of designing the visual interface of an application."
  };


  void _search() {
    final query = _controller.text.trim();
    if (query.isEmpty) {
      setState(() => _result = "Please enter a search term.");
      return;
    }

    // Case-insensitive search
    final matches = knowledgeBase.entries
        .where((e) => e.key.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (matches.isEmpty) {
      setState(() => _result = 'No relevant information found for "$query".');
    } else {
      setState(() {
        _result = matches
            .map((e) => "🔹 ${e.key[0].toUpperCase()}${e.key.substring(1)}: ${e.value}")
            .join("\n\n");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchEngine'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Type your query...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _search,
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
