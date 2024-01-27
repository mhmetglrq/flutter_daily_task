enum SvgConstants {
  calendar("calendar"),
  home("home"),
  menu("menu"),
  notification("notification"),
  projects("projects"),
  search("search"),
  threeDots("three_dots"),
  todoList("todo_list"),
  email("email"),
  eyeFilled("eye_filled"),
  eyeOff("eye_off"),
  signIn("sign_in"),
  signUp("sign_up"),
  person("person"),
  ;

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
