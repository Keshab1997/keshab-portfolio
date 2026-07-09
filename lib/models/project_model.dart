class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? imagePath;
  final String? liveUrl;
  final String? sourceUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.imagePath,
    this.liveUrl,
    this.sourceUrl,
  });
}
