import 'package:equatable/equatable.dart';

class SongEntity extends Equatable {
  final String id;
  final String name;
  final String imageURL;
  final String authorName;

  const SongEntity({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.authorName,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageURL,
      authorName,
    ];
  }

  @override
  bool get stringify => true;
}
