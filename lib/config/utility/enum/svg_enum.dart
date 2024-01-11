enum SvgConstants {
  calendar("assets/svg/calendar"),
  home("assets/svg/home"),
  menu("assets/svg/menu"),
  notification("assets/svg/notification"),
  projects("assets/svg/projects"),
  search("assets/svg/search"),
  threeDots("assets/svg/three_dots"),
  todoList("assets/svg/todo_list");

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/images/$value.svg';
}
