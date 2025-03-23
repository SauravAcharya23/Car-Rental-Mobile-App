import 'package:flutter/material.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({super.key});

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Person"),),
    );
  }
}