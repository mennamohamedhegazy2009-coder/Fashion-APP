import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInRight(
              child: const Text(
                'Create an\naccount',
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
              child: _buildTextField(hint: "Username or Email", icon: Icons.person),
            ),
            const SizedBox(height: 25),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: _buildTextField(hint: "Password", icon: Icons.lock, isPassword: true),
            ),
            const SizedBox(height: 25),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: _buildTextField(hint: "Confirm Password", icon: Icons.lock, isPassword: true),
            ),

            const SizedBox(height: 15),
            FadeIn(
              delay: const Duration(milliseconds: 700),
              child: RichText(
                text: const TextSpan(
                  text: 'By clicking the ',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  children: [
                    TextSpan(text: 'Register', style: TextStyle(color: Color(0xFFF83758))),
                    TextSpan(text: ' button, you agree to the public offer'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 35),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
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
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
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
                      const Text("I Already Have an Account "),
                      GestureDetector(
                        onTap: () => Navigator.pop(context), 
                        child: const Text(
                          "Login",
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