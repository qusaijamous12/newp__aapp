// settings_page.dart
import 'package:flutter/material.dart';


class SittingScreen extends StatefulWidget {
  static const String screenRoute = 'Sitting_Screen';

  @override
  _SittingScreenState createState() => _SittingScreenState();
}

class _SittingScreenState extends State<SittingScreen> {
  bool _receiveNotifications = false;
  bool _receivePromotionalEmails = false;
  String _unitPreference = 'metric';
  String _weightPreference = 'kg';
  String _languagePreference = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('lib/assest/logo.jpeg', height: 25),
            SizedBox(width: 10),
            Text('Home'), // Title next to the logo
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(170, 4, 131, 72),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
              //  Navigator.pushNamed(context, HomePage.screenRoute); // Navigate to Home
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
              //  Navigator.pushNamed(context, Account.screenRoute); // Navigate to Account
              },
            ),
            ListTile(
              title: Text('Membership Info'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
               // Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
               // Navigator.pushNamed(context, SittingScreen.screenRoute); // Navigate to Settings
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
              //  Navigator.pushNamed(context, ContactUs.screenRoute); // Navigate to Contact Us
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
              //  Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.screenRoute, (route) => false); // Logout logic
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Account section
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Set button color to green
                  onPressed: () {
                   // Navigator.pushNamed(context, RegistrationScreen.screenRoute);
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Set button color to green
                  onPressed: () {
                  //  Navigator.pushNamed(context, SignInScreen.screenRoute);
                  },
                  child: Text('Log In', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Set button color to green
                  onPressed: () {
                    // Continue as guest functionality
                  },
                  child: Text('Continue as Guest', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
              ],
            ),
            SizedBox(height: 20),

            // Notification preferences section
            Row(
              children: [
                Checkbox(
                  value: _receiveNotifications,
                  onChanged: (value) {
                    setState(() {
                      _receiveNotifications = value!;
                    });
                  },
                ),
                Text('Receive notifications about new features and updates'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _receivePromotionalEmails,
                  onChanged: (value) {
                    setState(() {
                      _receivePromotionalEmails = value!;
                    });
                  },
                ),
                Text('Receive promotional emails'),
              ],
            ),
            SizedBox(height: 20),

            // Unit preferences section
            Row(
              children: [
                Text('Unit of Measurement:'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'metric',
                  groupValue: _unitPreference,
                  onChanged: (value) {
                    setState(() {
                      _unitPreference = value as String;
                    });
                  },
                ),
                Text('Metric'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'imperial',
                  groupValue: _unitPreference,
                  onChanged: (value) {
                    setState(() {
                      _unitPreference = value as String;
                    });
                  },
                ),
                Text('Imperial'),
              ],
            ),
            SizedBox(height: 20),

            // Weight preferences section
            Row(
              children: [
                Text('Unit of Weight:'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'kg',
                  groupValue: _weightPreference,
                  onChanged: (value) {
                    setState(() {
                      _weightPreference = value as String;
                    });
                  },
                ),
                Text('kg'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'lbs',
                  groupValue: _weightPreference,
                  onChanged: (value) {
                    setState(() {
                      _weightPreference = value as String;
                    });
                  },
                ),
                Text('lbs'),
              ],
            ),
            SizedBox(height: 20),

            // Language preferences section
           const Row(
              children: [
                Text('Language:'),
              ],
            ),
            DropdownButton(
              value: _languagePreference,
              onChanged: (value) {
                setState(() {
                  _languagePreference = value as String;
                });
              },
              items:const [
                DropdownMenuItem(
                  child: Text('English', style: TextStyle(color: Colors.white)), // Set text color to white
                  value: 'en',
                ),
                DropdownMenuItem(
                  child: Text('French', style: TextStyle(color: Colors.white)), // Set text color to white
                  value: 'fr',
                ),
                DropdownMenuItem(
                  child: Text('Spanish', style: TextStyle(color: Colors.white)), // Set text color to white
                  value: 'es',
                ),
              ],
            ),
            SizedBox(height: 20),

            // Help and support section
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Set button color to green
                  onPressed: () {
                    // FAQs and help documentation functionality
                  },
                  child: Text('FAQs and Help Documentation', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Set button color to green
                  onPressed: () {
                    // Contact support team functionality
                  },
                  child: Text('Contact Support Team', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}