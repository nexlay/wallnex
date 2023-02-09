import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: 'lib/core/config/env/.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_CLIENT_ID', obfuscate: true)
  static final googleClientId = _Env.googleClientId;
  @EnviedField(varName: 'TWITTER_URL', obfuscate: true)
  static final twitterUrl = _Env.twitterUrl;
  @EnviedField(varName: 'GITHUB_URL', obfuscate: true)
  static final gitUrl = _Env.gitUrl;
  @EnviedField(varName: 'LINKED_IN_URL', obfuscate: true)
  static final linkedUrl = _Env.linkedUrl;
}