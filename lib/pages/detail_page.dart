import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    
    // Mengambil arguments yang dikirim dari HomePage
    final Map<String, dynamic> item = 
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Page',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['subtitle'],
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Sed euismod, nisl vel ultricies lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl nec nisl. Nulla facilisi. Sed euismod, nisl vel ultricies lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl nec nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Sed euismod, nisl vel ultricies lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl nec nisl.',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Home'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
