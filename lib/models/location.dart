class Location {
  final String title;
  final String category;
  final String roadAddress;
  final double mapX;
  final double mapY;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.mapX,
    required this.mapY,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      roadAddress: json['roadAddress'] ?? '',
      mapX: double.tryParse(json['mapx'] ?? '0') ?? 0,
      mapY: double.tryParse(json['mapy'] ?? '0') ?? 0,
    );
  }
}
