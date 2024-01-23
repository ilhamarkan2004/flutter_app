class Person {
  final String name;
  final String id;
  final String message;
  final String avatar;
  final String createdAt;

  const Person({
    required this.name,
    required this.id,
    required this.message,
    required this.avatar,
    required this.createdAt,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      id: json['id'],
      message: json['message'],
      avatar: json['avatar'],
      createdAt: json['createdAt'],
    );
  }
}
