import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaGarderieApp());
}

class MaGarderieApp extends StatelessWidget {
  const MaGarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Garderie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/2821/2821637.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.child_care,
                      size: 90,
                      color: Colors.teal,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ma Garderie',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(color: Colors.teal),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> activites = const [
    {
      "id": 1,
      "titre": "Dessin et coloriage",
      "description": "Développement de la créativité",
      "icone": "🎨"
    },
    {
      "id": 2,
      "titre": "Jeux éducatifs",
      "description": "Apprentissage par le jeu",
      "icone": "🧩"
    },
    {
      "id": 3,
      "titre": "Musique et chansons",
      "description": "Éveil musical des enfants",
      "icone": "🎵"
    },
    {
      "id": 4,
      "titre": "Lecture de contes",
      "description": "Découverte des histoires",
      "icone": "📚"
    },
    {
      "id": 5,
      "titre": "Activités sportives",
      "description": "Développement de la motricité",
      "icone": "⚽"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.child_care, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Ma Garderie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('Activités'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: activites.length,
        itemBuilder: (context, index) {
          final activite = activites[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade50,
                child: Text(
                  activite['icone'],
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              title: Text(
                activite['titre'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(activite['description']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}