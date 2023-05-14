class Contact{

  final int id;
  final String name;
  final String job;
  final String icon;
  final String? contactUrl;

  Contact({
    required this.id,
    required this.name,
    required this.job,
    required this.icon,
    this.contactUrl
  });


}