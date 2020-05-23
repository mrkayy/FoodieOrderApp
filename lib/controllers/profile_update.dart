import 'package:flutter/material.dart';

import './snackbar_notifier.dart';
import '../models/user_profile.dart';
import '../database/databaseHelper.dart';

final DatabaseHelper db = DatabaseHelper();
final formKey = GlobalKey<FormState>();
final newProfileInfo = UserProfile();

void submitProfileUpdate(
    {UserProfile data, oldData, GlobalKey<ScaffoldState> scafKey}) async {
  var formState = formKey.currentState;
  if (formState.validate()) {
    formState.save();
    // print('Update:');
    // print('new UserName: ${data.userName}');
    // print('new Name: ${data.fn}');
    // print('new PhoneNo: ${data.phoneNumber}');
    // print('\n\n');
    await db.updataUserAuthentication(
        newProfile: data.userName, oldProfile: oldData.userName);
    await db
        .updateUserProfile(user: data, oldProfile: oldData.userName)
        .catchError((onError) {
      notifiey(
        msg: 'an error occured!.',
        icons: Icons.error_outline,
        key: scafKey,
      );
    }).whenComplete(() => notifiey(
              msg: "Profile updated!!!.",
              key: scafKey,
              icons: Icons.thumb_up,
            ));
    formState.reset();
  }
}

Widget updateUserProfile({GlobalKey<ScaffoldState> key, UserProfile userInfo}) {
  return Builder(builder: (BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        'Update Profile',
        style: Theme.of(context).textTheme.title,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            submitProfileUpdate(
                data: newProfileInfo, oldData: userInfo, scafKey: key);
            Navigator.of(context).pop();
          },
          child: Text('ok'),
        ),
      ],
      content: Container(
        height: 0.22 * scrData.height,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                initialValue: userInfo.fn,
                onSaved: (e) => newProfileInfo.fn = e,
                validator: (v) => v.isEmpty ? 'field empty' : null,
                decoration: InputDecoration(labelText: "First Name"),
              ),
              TextFormField(
                initialValue: userInfo.userName,
                onSaved: (e) => newProfileInfo.userName = e,
                validator: (v) => v.isEmpty ? 'field empty' : null,
                decoration: InputDecoration(labelText: "User Name"),
              ),
              TextFormField(
                initialValue: userInfo.phoneNumber,
                onSaved: (e) => newProfileInfo.phoneNumber = e,
                validator: (v) => v.isEmpty ? 'field empty' : null,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Phone Number"),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
