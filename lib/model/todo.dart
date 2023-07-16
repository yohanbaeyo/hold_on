class ToDo {
  int id;
  String todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  //TODO: 처음 스페이스바 전에는 하이라이팅
  static List<ToDo> todoList() {
    return [
      ToDo(id: 1, todoText: '수세 문제 만들기', isDone: true),
      ToDo(id: 2, todoText: '물세 12주차 문제 풀기', isDone: false),
      ToDo(id: 3, todoText: '졸논 초고 완성'),
      ToDo(id: 4, todoText: '미적분 개인보고서'),
      ToDo(id: 4, todoText: '미적분 개인보고서', isDone: true),
      ToDo(id: 4, todoText: '미적분 개인보고서'),
      ToDo(id: 4, todoText: '미적분 개인보고서'),
      ToDo(id: 4, todoText: '미적분 개인보고서'),
    ];
  }
}
