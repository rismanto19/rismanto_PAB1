import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;
  void _signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Nama pengguna dan kata sandi harus diisi.';
      });
      return;
    }
    if (savedUsername.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText =
        'Pengguna belum terdaftar. Silakan daftar terlebih dahulu.';
      });
      return;
    }
    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      setState(() {
        _errorText = '';
        _isSignedIn = true;
        prefs.setBool('isSignedIn', true);
      });
    // Pemanggilan untuk menghapus semua halaman dalam tumpukan navigasi W
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
    // Sign in berhasil, navigasikan ke layar utama
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed (context, '/');
    });
  } else {
      setState(() {
        _errorText = 'Nama pengguna atau kata sandi salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo: 2. pasang appbar
      appBar: AppBar(title: Text('sign in'),),
      // Todo: 3. pasang body
      body: Center(
        child: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              // Todo 5. pasang textForfield nama pengguna
              TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "nama pengguna",
                border: OutlineInputBorder(),
              ),
              ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "kata sandi",
                errorText: _errorText.isNotEmpty ? _errorText : null,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off
                          : Icons.visibility,
                    ),),
              ),
              obscureText: _obscurePassword,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){},
                child: Text("sign in"),),
            SizedBox(height: 10),
            // TextButton(
            //     onPressed: (){},
            //     child: Text("Belum punya akun? Daftar di sini."),
            // ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: "Belum punya akun?",
                style: TextStyle(fontSize: 16, color: Colors.deepPurple
              ),
                children:  <TextSpan>[
                  TextSpan(
                    text: "Daftar di sini.",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      Navigator.pushNamed(context, '/signup');
                      },
                  )
                ]
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
