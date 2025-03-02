class TaskModel{
  String title;
  String date;

  TaskModel({required this.title, required this.date});
}

//data Dummy
List<TaskModel> taskList = [
  TaskModel(title: 'Belajar PKN', date: '12 August 2025'),
  TaskModel(title: 'Kecerdasan Buatan', date: '12 Maret 2025'),
  TaskModel(title: 'Tugas Agama', date: '12 February 2025'),
  TaskModel(title: 'Belajar PKN', date: '12 August 2025'),
  TaskModel(title: 'Kecerdasan Buatan', date: '12 Maret 2025'),
  TaskModel(title: 'Tugas Agama', date: '12 February 2025'),
];
