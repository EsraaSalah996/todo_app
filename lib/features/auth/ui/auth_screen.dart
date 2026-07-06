import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/custom_text_feild.dart';
import 'package:todo_app/features/home/ui/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final picker = ImagePicker();
  XFile? image;

  void pickFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void pickFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Choose"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                pickFromCamera();
                              },
                              icon: Icon(Icons.camera),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                pickFromGallery();
                              },
                              icon: Icon(Icons.browse_gallery),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: image != null
                      ? Image.file(File(image?.path ?? "")).image
                      : null,
                  child: image != null ? null : Icon(Icons.person, size: 50),
                ),
              ),
              SizedBox(height: 30),
              Text("Create your profile", style: AppTextStyle.headlineStyle),
              SizedBox(height: 12),
              Text("Add your name and picture", style: AppTextStyle.hintStyle),
              SizedBox(height: 30),
              CustomTextFeild(),
              SizedBox(height: 30),
              AppButton(
                title: "Continue",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
