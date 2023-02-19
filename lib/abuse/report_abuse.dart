// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_project/abuse_model.dart';
import 'package:i_project/auth/sign_up_.dart';
import 'package:i_project/utils.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportAbuse extends StatefulWidget {
  const ReportAbuse({super.key});

  @override
  State<ReportAbuse> createState() => _ReportAbuseState();
}

class _ReportAbuseState extends State<ReportAbuse> {
  bool _loading = false;
  late final TextEditingController _victimsNameController;
  late final TextEditingController _reportNameController;
  late final TextEditingController _reporterPhoneNumber;
  late final TextEditingController _relathionshipWithVictimController;
  late final TextEditingController _victimAddress;
  late final TextEditingController _victimAge;
  late final TextEditingController _abuseType;
  late final TextEditingController _descriptionController;

  bool get fieldIsEmpty =>
      _victimAddress.text.isEmpty ||
      _abuseType.text.isEmpty ||
      _reporterPhoneNumber.text.isEmpty ||
      _reportNameController.text.isEmpty ||
      _victimAge.text.isEmpty ||
      _victimsNameController.text.isEmpty ||
      _relathionshipWithVictimController.text.isEmpty ||
      _descriptionController.text.isEmpty;

  void clearFields() {
    _victimsNameController.clear();
    _reportNameController.clear();
    _reporterPhoneNumber.clear();
    _relathionshipWithVictimController.clear();
    _victimAddress.clear();
    _victimAge.clear();
    _abuseType.clear();
    _descriptionController.clear();
  }

  @override
  void initState() {
    super.initState();
    _victimsNameController = TextEditingController();
    _reportNameController = TextEditingController();
    _reporterPhoneNumber = TextEditingController();
    _relathionshipWithVictimController = TextEditingController();
    _victimAddress = TextEditingController();
    _victimAge = TextEditingController();
    _abuseType = TextEditingController();
    _descriptionController = TextEditingController();
  }

  Future report() async {
    try {
      if (!fieldIsEmpty) {
        _loading = true;
        setState(() {});
        final _model = AbuseModel(
          victimName: _victimsNameController.text.trim(),
          reporterName: _reportNameController.text.trim(),
          reporterPhoneNumber: _reporterPhoneNumber.text.trim(),
          relationshipWithVictim:
              _relathionshipWithVictimController.text.trim(),
          victimAddress: _victimAddress.text.trim(),
          victimsAge: _victimAge.text.trim(),
          abuseType: _abuseType.text.trim(),
          description: _descriptionController.text.trim(),
        );
        FirebaseFirestore.instance
            .collection("Reports")
            .add(_model.toMap())
            .then((value) {
          _loading = false;
          setState(() {});
          clearFields();
        });
      } else {
        Toast.show("Please fill all Fields.");
      }
    } on FirebaseException catch (e) {
      _loading = false;
      setState(() {});
      Toast.show(e.message ?? "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.bodyPadding),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Utils.blockHeight * 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Report Abuse",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: Utils.blockWidht * 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await launchUrl(Uri.parse("sms: +2347066566595"));
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.red,
                            size: Utils.blockWidht * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Utils.blockHeight * 3),
                  TextFieldGradient(
                    label: "Victim",
                    hint: "Enter victim's name",
                    controller: _victimsNameController,
                  ),
                  TextFieldGradient(
                    label: "Reporter's Name",
                    hint: "Enter your name",
                    controller: _reportNameController,
                  ),
                  TextFieldGradient(
                    label: "Reporter's Phone number",
                    hint: "Enter your phone number",
                    controller: _reporterPhoneNumber,
                  ),
                  TextFieldGradient(
                    label: "Relationship with victim",
                    hint: "Relationship...",
                    controller: _relathionshipWithVictimController,
                  ),
                  TextFieldGradient(
                    label: "Address",
                    hint: "Enter victim's address",
                    controller: _victimAddress,
                  ),
                  TextFieldGradient(
                    label: "victim's age",
                    hint: "Enter victim's age",
                    controller: _victimAge,
                  ),
                  TextFieldGradient(
                    label: "Abuse type",
                    hint: "Enter type of abuse (rape etc)",
                    controller: _abuseType,
                  ),
                  TextFieldGradient(
                    label: "Description",
                    hint: "Short note on what happened",
                    controller: _descriptionController,
                  ),
                  GestureDetector(
                    onTap: report,
                    child: Container(
                      width: double.infinity,
                      height: Utils.blockHeight * 5.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Utils.borderRadius),
                        gradient: Utils.gradient,
                      ),
                      child: Center(
                        child: _loading
                            ? const CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                            : Text(
                                "Report",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Utils.blockWidht * 3.3,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
