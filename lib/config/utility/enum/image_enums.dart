enum ImageConstants {
  signIn("sign_in"),
  ;

  final String value;
  const ImageConstants(this.value);

  String get getPng => 'assets/images/$value.png';
}
