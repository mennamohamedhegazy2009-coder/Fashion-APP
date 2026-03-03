import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeft(
              child: const Text(
                'Welcome\nBack!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: _buildTextField(
                hint: "Username or Email",
                icon: Icons.person,
              ),
            ),
            const SizedBox(height: 25),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: _buildTextField(
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                   Navigator.pushNamed(context, '/forgot_password');
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color(0xFFF83758)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Pulse(
              delay: const Duration(milliseconds: 100),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/GetStarted');
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF83758),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  const Text("- OR Continue with -", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon("assets/google-logo-9808 1.png"), 
                        const SizedBox(width: 15),
                        _socialIcon("assets/apple_logo_icon_147318.png"),
                        const SizedBox(width: 15),
                        _socialIcon("assets/Facebook Icon.png"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Create An Account "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xFFF83758), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: Colors.grey) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
  Widget _socialIcon(String path) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFF83758)),
        color: const Color(0xFFFDECEF),
      ),
      child: Image.asset(path, width: 25, height: 25),
    );
  }
}