enum ImageConstants {
  signIn("sign_in"),
  profile("profile"),
  ;

  final String value;
  const ImageConstants(this.value);

  String get getPng => 'assets/images/$value.png';
}
