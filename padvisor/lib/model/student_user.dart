class studentUser {
  final String uid;

  studentUser({this.uid});

  String cohort;
  String ic;
  String matric;
  String sem;
  String email;
  String name;
  String password;
  String phone;
  String wechat;

  studentUserData(String cohort, String ic, String matric, String sem,
      String email, String name, String password, String phone, String wechat) {
    this.cohort = cohort;
    this.ic = ic;
    this.matric = matric;
    this.sem = sem;
    this.email = email;
    this.name = name;
    this.password = password;
    this.phone = phone;
    this.wechat = wechat;
  }
}
