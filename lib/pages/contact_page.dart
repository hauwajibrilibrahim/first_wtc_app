import 'package:first_app/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact'), centerTitle: true, automaticallyImplyLeading: false,),
      body: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
              child: ContactItem(),
            ),
          ],
        ),
      ),
    );
  }
}

