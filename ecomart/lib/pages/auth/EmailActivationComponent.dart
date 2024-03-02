import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailActivationComponent extends StatefulWidget {
  @override
  _EmailActivationComponentState createState() =>
      _EmailActivationComponentState();
}

class _EmailActivationComponentState extends State<EmailActivationComponent> {
  final TextEditingController _activationCodeController =
      TextEditingController();

  String _message = '';

  Future<void> _activateAccount() async {
    final String activationCode = _activationCodeController.text;

    try {
      final response = await http.post(
        Uri.parse('http:/api/activate-account/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'code': activationCode,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _message = 'Account activated. Proceed to login.';
        });
        // Redirect to login page after successful activation
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      } else {
        throw Exception('Failed to activate account: ${response.body}');
      }
    } catch (error) {
      setState(() {
        _message = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Activation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _message,
                  style: TextStyle(
                    color: _message.startsWith('Failed')
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
                TextFormField(
                  controller: _activationCodeController,
                  decoration: InputDecoration(labelText: 'Activation Code'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _activateAccount,
                  child: Text('Activate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
