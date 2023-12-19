class Favourite {
  final String? imageUrl;
  bool isImportant;
  final String title;
  final String content;
  Favourite(
      {required this.title,
        this.imageUrl,
        required this.content,
        required this.isImportant});

  factory Favourite.fromJson(Map<String, dynamic> map) {
    return Favourite(
      title: map['title'],
      imageUrl: map['imageUrl'],
      content: map['content'],
      isImportant: map['isImportant'] == 1,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'content': content,
      'isImportant': isImportant == true ? 1 : 0,
    };
  }
}