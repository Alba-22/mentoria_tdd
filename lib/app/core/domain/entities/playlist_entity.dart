// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class PlaylistEntity extends Equatable {
  final String id;
  final String name;
  final String imageURL;
  final int songsQuantity;
  final int totalSeconds;

  const PlaylistEntity({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.songsQuantity,
    required this.totalSeconds,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageURL,
      songsQuantity,
      totalSeconds,
    ];
  }

  @override
  bool get stringify => true;
}
