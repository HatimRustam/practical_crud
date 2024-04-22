class student_model{
  final student_name;
  final student_grid;
  final student_standard;
  final student_image;
  student_model(
      {required this.student_name,
      required this.student_grid,
      required this.student_standard,
       this.student_image});
}
List<student_model> student_model_class = List.empty(growable: true);