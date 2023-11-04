import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushiman/page/main_screen.dart';
import 'package:shushiman/widgets/Button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF618264),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Sushi Ja",
                style: GoogleFonts.redHatDisplay(
                    fontSize: 40,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.w500),
              ),
              Image.network(
                "https://media.discordapp.net/attachments/883704858966904874/1170038808193015838/Screenshot_2023-03-07-11-30-21-729-edit_com.instagram.android.png?ex=6557968e&is=6545218e&hm=c28c95e57d6cc59dd3d2babebfeda689f6a393c7cd40967cd343953f4f4127a6&=&width=676&height=662",
                fit: BoxFit.cover,
                height: 270,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 235, 235),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 235, 235),
                      width: 2.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "ชื่อผู้ใช้",
                  labelStyle: GoogleFonts.redHatDisplay(
                      color: const Color.fromARGB(255, 235, 235, 235)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "โปรดกรอกชื่อผู้ใช้";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 235, 235),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 235, 235),
                      width: 2.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "รหัสผ่าน",
                  labelStyle: GoogleFonts.redHatDisplay(
                      color: const Color.fromARGB(255, 235, 235, 235)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "โปรดกรอกรหัสผ่าน";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                text: "Login",
                onTap: () {
                  Get.to(const MainScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
