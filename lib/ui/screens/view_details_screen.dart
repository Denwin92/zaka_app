import 'package:e_group_x/data/models/account.dart';
import 'package:e_group_x/data/models/globals.dart';
import 'package:e_group_x/widgets/zaka_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Account account = Globals.instance.account;
    return Scaffold(
      appBar: const ZakaAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Your user details are as follows',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.white60],
                  ),
                  borderRadius: BorderRadius.circular(14.0)),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildRowItem("First Name: ", account.firstName),
                    _buildRowItem("Last Name: ", account.lastName),
                    _buildRowItem("Cell Number: ", account.cellNumber),
                    _buildRowItem("Email Address: ", account.emailAddress),
                    _buildRowItem("Street Number: ", account.streetNumber),
                    _buildRowItem("Street Name: ", account.streetName),
                    _buildRowItem("Suburb: ", account.suburb),
                    _buildRowItem("City: ", account.city),
                    _buildRowItem("Province: ", account.province),
                    _buildRowItem("ID Number: ", account.idNumber),
                    _buildRowItem("Birthday: ",
                        DateFormat('dd MMMM yyyy').format(account.dateOfBirth!))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem(String key, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  key,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(flex: 2, child: Text(value ?? ''))
          ],
        ),
      ),
    );
  }
}
