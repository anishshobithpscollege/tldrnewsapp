class Data {
  final int id;
  final String url;
  final String title;
  final String tldr;
  final String date;
  final String category;
  final String newsletter;

  Data({
    required this.id,
    required this.url,
    required this.title,
    required this.tldr,
    required this.date,
    required this.category,
    required this.newsletter,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      tldr: json['tldr'] as String,
      date: json['date'] as String,
      category: json['category'] as String,
      newsletter: json['newsletter'] as String,
    );
  }
}
