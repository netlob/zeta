class Appointment {
  final int id;
  final int start;
  final int end;
  final int startTimeSlot;
  final int endTimeSlot;

  final List<dynamic> subjects;
  final List<dynamic> teachers;
  final List<dynamic> groups;
  final List<dynamic> locations;

  final String type;
  final String remark;
  final String changeDescription;

  final bool valid;
  final bool cancelled;
  final bool modified;
  final bool moved;

  final dynamic isNew;

  Appointment(
      {this.id,
      this.start,
      this.end,
      this.startTimeSlot,
      this.endTimeSlot,
      this.subjects,
      this.teachers,
      this.groups,
      this.locations,
      this.type,
      this.remark,
      this.valid,
      this.cancelled,
      this.modified,
      this.moved,
      this.isNew,
      this.changeDescription});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      start: json['start'],
      end: json['end'],
      startTimeSlot: json['startTimeSlot'],
      endTimeSlot: json['endTimeSlot'],
      subjects: json['subjects'],
      teachers: json['teachers'],
      groups: json['groups'],
      locations: json['locations'],
      type: json['type'],
      remark: json['remark'],
      valid: json['valid'],
      cancelled: json['cancelled'],
      modified: json['modified'],
      moved: json['moved'],
      isNew: json['isNew'],
      changeDescription: json['changeDescription'],
    );
  }
}
