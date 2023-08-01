import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: 'lib/core/config/env/.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_CLIENT_ID', obfuscate: true)
  static final String googleClientId = _Env.googleClientId;
  @EnviedField(varName: 'TWITTER_URL', obfuscate: true)
  static final String twitterUrl = _Env.twitterUrl;
  @EnviedField(varName: 'GITHUB_URL', obfuscate: true)
  static final String gitUrl = _Env.gitUrl;
  @EnviedField(varName: 'LINKED_IN_URL', obfuscate: true)
  static final String linkedUrl = _Env.linkedUrl;
  @EnviedField(varName: 'ANDROID_BANNER_AD_ID', obfuscate: true)
  static final String bannerId = _Env.bannerId;
  @EnviedField(varName: 'ENTITLEMENTS_ID', obfuscate: true)
  static final String entitlementsId = _Env.entitlementsId;
  @EnviedField(varName: 'GOOGLE_API_PURCHASE_KEY', obfuscate: true)
  static final String googleApiPurchaseKey = _Env.googleApiPurchaseKey;
}