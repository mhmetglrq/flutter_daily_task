enum SvgConstants {
  calendar("calendar"),
  home("home"),
  menu("menu"),
  notification("notification"),
  projects("projects"),
  search("search"),
  threeDots("three_dots"),
  todoList("todo_list");

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
