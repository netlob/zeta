import 'package:zeta/services/zermelo/Appointment/Appointment.dart';

class Day {
  final DateTime date;
  List<Appointment> appointments;

  Day({this.date, this.appointments});
}
