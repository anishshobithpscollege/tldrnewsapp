class DataModel {
    final int id;
    final String url;
    final String title;
    final String tldr;
    final String date;
    final String category;
    final String newsletter;

    DataModel({
        required this.id,
        required this.url,
        required this.title,
        required this.tldr,
        required this.date,
        required this.category,
        required this.newsletter,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) {
        return DataModel(
            id: json['id'],
            url: json['url'],
            title: json['title'],
            tldr: json['tldr'],
            date: json['date'].toString(),
            category: json['category'],
            newsletter: json['newsletter'],
        );
    }
}