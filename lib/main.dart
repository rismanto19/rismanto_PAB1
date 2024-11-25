import 'package:wisata_candi_rismanto/data/candi_data.dart';
import 'package:wisata_candi_rismanto/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi_rismanto/screens/home_screen.dart';
import 'package:wisata_candi_rismanto/screens/favorite_screen.dart';
import 'package:wisata_candi_rismanto/screens/profile_screen.dart';
import 'package:wisata_candi_rismanto/screens/search_screen.dart';
import 'package:wisata_candi_rismanto/screens/signin_screen.dart';
import 'package:wisata_candi_rismanto/screens/signup_screen.dart';
void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context) => SignUpScreen(),
        '/SignInScreen' : (context) => SigninScreen(),
        // '/SignUpScreen' : (context) => SignUpScreen(),
      }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => SigninScreen(),
        '/signup' : (context) => SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Deklarasi Variabel
  int _currentIndex = 0;
  final List<Widget>_children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        // TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(
            canvasColor: Colors.deepPurple[50]
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}


