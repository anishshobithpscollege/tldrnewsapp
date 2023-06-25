import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:tldr/models/data.dart';
import 'package:tldr/widgets/loading_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tldr/widgets/nav.dart';
import 'package:tldr/widgets/webview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const Map<String, IconData> _bottomNavigationBarLabels = {
    'Tech': FontAwesomeIcons.globe,
    'Crypto': FontAwesomeIcons.nfcSymbol,
    'Engineering': FontAwesomeIcons.gear,
    'Founders': FontAwesomeIcons.peopleGroup,
    'AI': FontAwesomeIcons.brain,
  };

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<List<Data>> _fetchData(String category) async {
    final url =
        'https://tldrapi-production.up.railway.app/api/${category.toLowerCase()}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      final data = jsonData.map((item) => Data.fromJson(item)).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _openWebView(String title, String url) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TLDR News App'),
        leading: Image.asset('assets/images/logo.png'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        child: const FaIcon(FontAwesomeIcons.info),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: FutureBuilder<List<Data>>(
          key: ValueKey<int>(_selectedIndex),
          future: _fetchData(
              _bottomNavigationBarLabels.keys.elementAt(_selectedIndex)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data!;
              final groupedData =
                  groupBy<Data, String>(data, (item) => item.category);

              return Expanded(
                child: ListView.builder(
                  itemCount: groupedData.length,
                  itemBuilder: (context, categoryIndex) {
                    final category = groupedData.keys.elementAt(categoryIndex);
                    final categoryItems = groupedData[category]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            category.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: categoryItems.length,
                          itemBuilder: (context, index) {
                            final item = categoryItems[index];
                            return ListTile(
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(item.tldr),
                              onTap: () {
                                _openWebView(item.title, item.url);
                              },
                            );
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 32,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        labels: _bottomNavigationBarLabels.keys.toList(),
        icons: _bottomNavigationBarLabels.values.toList(),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
