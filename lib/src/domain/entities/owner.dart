import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final int reputation;
  final String profileImage;
  final String displayName;

  const Owner({required this.reputation, required this.profileImage, required this.displayName});

  @override
  List<Object> get props => [reputation, profileImage, displayName];
}
