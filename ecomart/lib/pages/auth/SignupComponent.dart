import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'EmailActivationComponent.dart';

class SignupComponent extends StatefulWidget {
  @override
  _SignupComponentState createState() => _SignupComponentState();
}

class _SignupComponentState extends State<SignupComponent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _whatsappNumberController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String _message = '';
  bool _showEmailActivation = false;

  Future<void> _signup() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String whatsappNumber = _whatsappNumberController.text;
    final String username = _usernameController.text;

    try {
      final response = await http.post(
        Uri.parse('http:/0/api/signup/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'whatsapp_number': whatsappNumber,
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _message = 'User signed up successfully.';
          _showEmailActivation = true;
        });
      } else {
        throw Exception('Failed to signup: ${response.body}');
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
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _showEmailActivation
              ? EmailActivationComponent()
              : Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'First Name'),
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'Last Name'),
                      ),
                      TextFormField(
                        controller: _whatsappNumberController,
                        decoration:
                            InputDecoration(labelText: 'WhatsApp Phone Number'),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _signup,
                        child: Text('Sign Up'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _message,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
