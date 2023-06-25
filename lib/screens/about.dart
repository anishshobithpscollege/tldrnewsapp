import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_KLaN10ftkY.json',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'TLDR News App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey[200],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text(
                  'This app provides summarized news articles from various categories, including Tech, Crypto, Engineering, Founders, and AI.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey[200],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Open Instagram profile
                    },
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Open GitHub profile
                    },
                    icon: const FaIcon(FontAwesomeIcons.github),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Open source code link
                    },
                    icon: const FaIcon(FontAwesomeIcons.code),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Open website link
                    },
                    icon: const FaIcon(FontAwesomeIcons.link),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Developed by: Anish Shobith P S',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '© 2023',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
