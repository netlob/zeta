class User {
  final String firstName;
  final String lastName;
  final String prefix;

  final bool isArchived;
  final bool hasPassword;
  final bool isApplicationManager;
  final bool isStudent;
  final bool isEmployee;
  final bool isFamilyMember;
  final bool isSchoolScheduler;
  final bool isSchoolLeader;
  final bool isStudentAdministrator;
  final bool isTeamLeader;
  final bool isSectionLeader;
  final bool isMentor;
  final bool isDean;

  User(
      {this.firstName,
      this.lastName,
      this.prefix,
      this.isArchived,
      this.hasPassword,
      this.isApplicationManager,
      this.isStudent,
      this.isEmployee,
      this.isFamilyMember,
      this.isSchoolScheduler,
      this.isSchoolLeader,
      this.isStudentAdministrator,
      this.isTeamLeader,
      this.isSectionLeader,
      this.isMentor,
      this.isDean});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      prefix: json['prefix'],
      isArchived: json['archived'],
      hasPassword: json['hasPassword'],
      isApplicationManager: json['isApplicationManager'],
      isStudent: json['isStudent'],
      isEmployee: json['isEmployee'],
      isFamilyMember: json['isFamilyMember'],
      isSchoolScheduler: json['isSchoolScheduler'],
      isSchoolLeader: json['isSchoolLeader'],
      isStudentAdministrator: json['isStudentAdministrator'],
      isTeamLeader: json['isTeamLeader'],
      isSectionLeader: json['isSectionLeader'],
      isMentor: json['isMentor'],
      isDean: json['isDean'],
    );
  }
}
