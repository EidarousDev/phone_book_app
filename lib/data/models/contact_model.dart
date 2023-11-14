import '../../core/app_config.dart';
import '../../domain/entities/contact_entity.dart';

class ContactModel extends Contact {
  const ContactModel(
      {required super.id,
      required super.name,
      required super.phone,
      required super.avatar});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
        id: json['id'],
        name: json['name'] ?? AppConfig.defaultName,
        phone: json['phone'],
        avatar: json['avatar'] ?? AppConfig.defaultAvatar);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phone': phone, 'avatar': avatar};
  }
}
