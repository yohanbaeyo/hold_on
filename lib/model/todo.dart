class ToDo {
  int id;
  String todoText;
  bool isDone;
  static int latest_primary_number = 8;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  //TODO: 처음 스페이스바 전에는 하이라이팅
  static List<ToDo> todoList() {
    return [
      ToDo(id: 0, todoText: '수세 문제 만들기', isDone: true),
      ToDo(id: 1, todoText: '물세 12주차 문제 풀기', isDone: false),
      ToDo(id: 2, todoText: '졸논 초고 완성'),
      ToDo(id: 3, todoText: '미적분 개인보고서'),
      ToDo(id: 4, todoText: '관현악 미니 오케스트라 연습', isDone: true),
      ToDo(id: 5, todoText: '독서 주제통합 보고서 작성'),
      ToDo(id: 6, todoText: '물세 11주차 문제 풀기'),
      ToDo(id: 7, todoText: '물세 10주차 문제 풀기'),
    ];
  }
}
