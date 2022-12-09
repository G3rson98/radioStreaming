class HistoryItem{
  final int id;
  final String title;
  final String subTitle;
  final String image;
  final String file;

  HistoryItem({
    required this.id,
    required this.title,
    this.subTitle = '',
    required this.image,
    required this.file
  });
}