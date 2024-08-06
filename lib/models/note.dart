class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
      id: 0,
      title: "",
      content:
          "tincidunt elit lorem. eget ex vitae sodales. quis quis volutpat commodoultrices quis vitae urna placerat ipsum Cras enim. ex. dignissim, Ut Sed Quisque amet raw...",
      modifiedTime: DateTime(2024, 12, 8)),
  Note(
      id: 1,
      title: "To do",
      content:
          "hendrerit non eu nisl. luctus non, dolor urna.tincidunt tincidunt at, non. vitae non at, Nullam quis elit dolor nisi non, sodales. orci ultrices ex. urna. at ",
      modifiedTime: DateTime(2024, 8, 8)),
  Note(
      id: 2,
      title: "A song",
      content:
          "dolor facilisis risus non enim. tincidunt faucibus ex Praesent facilisis Cras venenatis ex efficitur. vitae ullamcorper leo. Nunc eget dui. tincidunt massa id ",
      modifiedTime: DateTime(2024, 8, 3)),
];
