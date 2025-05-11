import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    // Data dummy untuk ditampilkan dalam list
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Flutter Development',
        'subtitle': 'Learn UI design with Flutter',
        'imageUrl': 'https://picsum.photos/id/1/200',
      },
      {
        'title': 'Dart Programming',
        'subtitle': 'Master the Dart language',
        'imageUrl': 'https://picsum.photos/id/2/200',
      },
      {
        'title': 'State Management',
        'subtitle': 'Advanced state management techniques',
        'imageUrl': 'https://picsum.photos/id/3/200',
      },
      {
        'title': 'Material Design',
        'subtitle': 'Implementing Material Design principles',
        'imageUrl': 'https://picsum.photos/id/4/200',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Multi Page',
          style: textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode 
                ? Icons.light_mode 
                : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Multi-Theme App',
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Explore different themes and navigation',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Featured Items',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: items[index]['title'],
                    subtitle: items[index]['subtitle'],
                    imageUrl: items[index]['imageUrl'],
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: items[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Floating action button pressed!',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              backgroundColor: themeProvider.isDarkMode 
                  ? ThemeProvider.darkAccent 
                  : ThemeProvider.lightAccent,
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}