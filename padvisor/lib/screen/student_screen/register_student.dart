import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_student.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/screen/login_student.dart';

class RegisterStudent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String name;
  String matric;
  String password;
  String ic;
  String sem;
  String cohort;
  String phone;
  String email;
  String wechat;

  final AuthStudentService _auth = AuthStudentService();

  //controller
  final _controllerName = TextEditingController();
  final _controllerMatric = TextEditingController();
  final _controllerPw = TextEditingController();
  final _controllerIc = TextEditingController();
  final _controllerSem = TextEditingController();
  final _controllerCohort = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerWechat = TextEditingController();

// method to set data from textformfield into variable
  void setVariable() {
    name = _controllerName.text;
    matric = _controllerMatric.text;
    password = _controllerPw.text;
    ic = _controllerIc.text;
    sem = _controllerSem.text;
    cohort = _controllerCohort.text;
    phone = _controllerPhone.text;
    email = _controllerEmail.text;
    wechat = _controllerWechat.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'PAdvisor',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Register Student',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  //regForm(context),
                  //
                  // Enter Name
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Name cannot be empty' : null,
                            controller: _controllerName,
                            decoration: InputDecoration(
                              labelText: 'Enter your name',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Matric No
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Matric No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerMatric,
                            validator: (val) => val.isEmpty
                                ? 'Matric no. cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter Matric no',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter password
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Password cannot be empty' : null,
                            controller: _controllerPw,
                            decoration: InputDecoration(
                              hintText: 'more than 6 characters',
                              labelText: 'Enter your Password',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter IC/Passport
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IC/Passport no:',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'IC/Passport cannot be empty'
                                : null,
                            controller: _controllerIc,
                            decoration: InputDecoration(
                              labelText: 'Enter IC/Passport ',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Semester Session
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Semester Session',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            controller: _controllerSem,
                            decoration: InputDecoration(
                              labelText: 'eg. 2020/2021-2',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Cohort
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cohort: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            controller: _controllerCohort,
                            decoration: InputDecoration(
                              labelText: 'eg. 2019/2023',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Phone
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            controller: _controllerPhone,
                            decoration: InputDecoration(
                              labelText: 'Enter your phone No.',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter email
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-mail: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerEmail,
                            validator: (val) =>
                                val.isEmpty ? 'E-mail cannot be empty' : null,
                            decoration: InputDecoration(
                              labelText: 'Enter e-mail',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter WeChat ID
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WeChat ID: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerWechat,
                            validator: (val) => val.isEmpty
                                ? 'WeChat ID cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter WeChat ID ',
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setVariable();
                        print(name +
                            matric +
                            password +
                            ic +
                            sem +
                            cohort +
                            phone +
                            email +
                            wechat);

                        dynamic result =
                            await _auth.registerStudent(email, password);
                        DatabaseServices(uid: result.uid).registerStudentData(
                            name,
                            matric,
                            password,
                            ic,
                            sem,
                            cohort,
                            phone,
                            email,
                            wechat);
                        if (result != null) {
                          print('Succesfully register');
                          Navigator.pop(
                            context,
                            // MaterialPageRoute(builder: (context) => LoginStudent()),
                          );
                        } else {
                          print('error occured');
                        }
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text('Register')),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                ],
              ),
            ),
            //),
          ),
        ));
  }

  Widget editDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          TextField(
              decoration: InputDecoration(
            labelText: details,
          )),
        ],
      ),
    );
  }

  Widget editSemDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('/'),
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('-'),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 50,
                child: TextField(
                    decoration: InputDecoration(
                  labelText: '',
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget editCohortDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('/'),
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget regForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        editDetail(context, 'Name: ', 'Enter your Name'),
        editDetail(context, 'Matric No:  ', 'Enter your Matric No'),
        editDetail(context, 'IC/Passport No: ', 'Enter your IC/Passport'),
        editSemDetail(context, 'Semester Session: ', '20**'),
        editCohortDetail(context, 'Cohort: ', '20**'),
        editDetail(context, 'Telephone No: ', 'Enter your Telephone No'),
        editDetail(context, 'Email: ', 'Enter your Email'),
      ],
    );
  }
}
