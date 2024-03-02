import 'package:ecomart/pages/Productsview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final String token;

  ProfileScreen({required this.token});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    redirectToProfilePage();
  }

  Future<void> redirectToProfilePage() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost/profile'),
        headers: {
          'Authorization': 'Token ${widget.token}',
        },
      );
      if (response.statusCode == 200) {
        // Successfully redirected to profile page
      } else {
        throw Exception(
            'Failed to redirect to profile page: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error redirecting to profile page: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductListView()), // Navigate to ProductListView
            );
          },
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
