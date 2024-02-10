import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'search_user.g.dart';

@HiveType(typeId: 1)
class SearchUser extends Equatable {
  @HiveField(0)
  final String uId;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String photoUrl;
  @HiveField(4)
  final bool isAnonymous;

  const SearchUser(
      {required this.uId,
      required this.email,
      required this.name,
      required this.photoUrl,
      required this.isAnonymous});

  factory SearchUser.initialData() => const SearchUser(
        uId: '',
        email: '',
        name: '',
        photoUrl: '',
        isAnonymous: true,
      );

  @override
  List<Object?> get props => [uId, email, name, isAnonymous];
}
