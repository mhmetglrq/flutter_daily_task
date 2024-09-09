enum SvgConstants {
  calendar("calendar"),
  clock("clock"),
  home("home"),
  menu("menu"),
  tasks("tasks"),
  logout("logout"),
  add("add"),
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
  settings("settings"),
  person("person"),
  github("github"),
  medium("medium"),
  linkedin("linkedin"),
  stackOverflow("stack_overflow"),
  web("web"),
  editProfile("edit_profile"),
  projectCategory("project_category"),
  latestProject("latest_project"),
  ;

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
