import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: 'SourceSansPro',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Mi Card"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    radius: 76,
                    backgroundImage: AssetImage('images/ava.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Ngô Quốc Vinh',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'DEVELOPER',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal[800],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: Colors.teal[200],
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(height: 20),
                _buildContactCard(
                  icon: Icons.email,
                  text: 'Email@gmail.com',
                  context: context,
                ),
                const SizedBox(height: 16),
                _buildContactCard(
                  icon: Icons.phone,
                  text: '0909999009',
                  context: context,
                ),
                const SizedBox(height: 16),
                _buildContactCard(
                  icon: Icons.home,
                  text: '8386 ABC Street',
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String text,
    required BuildContext context,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Icon(
          icon,
          color: Colors.teal,
          size: 28,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}