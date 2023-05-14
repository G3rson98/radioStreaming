import '../../../../core/http/http_options.dart';
import '../../domain/entities/contact.dart';

class ContactModel extends Contact{

  ContactModel({required super.id,required super.name, required super.job, required super.icon,super.contactUrl});

  factory ContactModel.fromJson(Map<String,dynamic> json) => ContactModel(
    id: json["id"],
    name: json["name"],
    job: json["job"],
    icon: '${HttpOptions.apiUrl}/assets/${json["icon"]}?height=80&width=80',
    contactUrl: json["contact_url"]
  );
}