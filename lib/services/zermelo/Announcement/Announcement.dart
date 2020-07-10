class Announcement {
  final int id;
  final int start;
  final int end;

  final String title;
  final String text;

  Announcement({this.id, this.start, this.end, this.title, this.text});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
        id: json['id'],
        start: json['start'],
        end: json['end'],
        title: json['title'],
        text: json['text']);
  }
}
