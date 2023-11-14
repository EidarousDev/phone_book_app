import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String avatar;

  const Contact(
      {required this.id,
      required this.name,
      required this.phone,
      required this.avatar});

  Contact copyWith({String? id, String? name, String? phone, String? avatar}) =>
      Contact(
          id: id ?? this.id,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          avatar: avatar ?? this.avatar);
  @override
  List<Object?> get props => [id, name, phone, avatar];
}
