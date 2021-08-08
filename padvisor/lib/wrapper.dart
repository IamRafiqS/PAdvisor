import 'package:flutter/material.dart';
import 'package:padvisor/model/pa_user.dart';
import 'package:padvisor/screen/homepage_pa.dart';
import 'package:padvisor/screen/login_pa.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<paUser>(context);
    print(user);

    if (user == null) {
      return loginpa();
    } else {
      return homepagepa();
    }
  }
}
