import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uId;
  final String email;
  final String name;
  final String photoUrl;
  final bool isAnonymous;

  const LocalUser({
    required this.uId,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.isAnonymous,
  });

  factory LocalUser.initialData() => const LocalUser(
        uId: '',
        email: '',
        name: '',
        photoUrl: '',
        isAnonymous: true,
      );

  @override
  List<Object?> get props => [uId, email, name, isAnonymous];
}
