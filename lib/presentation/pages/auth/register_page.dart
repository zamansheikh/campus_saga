// lib/pages/auth/register_page.dart

import 'dart:io';

import 'package:campus_saga/presentation/bloc/auth/auth_bloc.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_event.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_state.dart';
import 'package:campus_saga/presentation/pages/widgets/text_editing_field.dart';
import 'package:campus_saga/presentation/pages/widgets/university_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController universityController = TextEditingController();

  final List<String> universities = [
    'Daffodil International University @DIU',
    'North South University @NSU',
    'American International University-Bangladesh @AIUB',
    'BRAC University @BRACU',
    'East West University @EWU',
    'Independent University, Bangladesh @IUB',
    'United International University @UIU',
    'Ahsanullah University of Science and Technology @AUST',
    'Bangladesh University of Professionals @BUP',
    'Bangladesh University of Engineering and Technology @BUET',
    'University of Dhaka @DU',
    'Jahangirnagar University @JU',
    'Jagannath University @JnU',
    'University of Chittagong @CU',
    'Rajshahi University @RU',
    'Khulna University @KU',
    'Bangladesh Agricultural University @BAU',
    'Shahjalal University of Science and Technology @SUST',
    'Islamic University, Bangladesh @IU',
    'Hajee Mohammad Danesh Science and Technology University @HSTU',
    'Mawlana Bhashani Science and Technology University @MBSTU',
    'Noakhali Science and Technology University @NSTU',
    'Pabna University of Science and Technology @PUST',
    'Patuakhali Science and Technology University @PSTU',
    'Sher-e-Bangla Agricultural University @SAU',
    'Sylhet Agricultural University @SAU',
    'Chittagong Veterinary and Animal Sciences University @CVASU',
    'Khulna University of Engineering and Technology @KUET',
    'Rajshahi University of Engineering and Technology @RUET',
    'Bangladesh University of Textiles @BUTEX',
    'Dhaka University of Engineering and Technology @DUET',
    'Jessore University of Science and Technology @JUST',
    'Bangabandhu Sheikh Mujibur Rahman Science and Technology University @BSMRSTU',
    'Chittagong University of Engineering and Technology @CUET',
  ];

  File? selectedImage;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Sign Up Successful!")));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (state is AuthUnauthenticated) {
            //call logOut Event
            BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : NetworkImage(
                                  "https://loremflickr.com/200/200?random=2")
                              as ImageProvider,
                      child:
                          selectedImage == null ? Icon(Icons.camera_alt) : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextEditingField(
                    controller: userNameController,
                    labelText: "User Name",
                    icon: Icons.person,
                  ),
                  SizedBox(height: 20),
                  UniversitySearchField(
                    controller: universityController,
                    universityList: universities,
                  ),
                  SizedBox(height: 20),
                  TextEditingField(
                    controller: emailController,
                    labelText: "Email",
                    icon: Icons.email,
                  ),
                  SizedBox(height: 20),
                  TextEditingField(
                    controller: passwordController,
                    labelText: "Password",
                    icon: Icons.lock,
                    isObscure: true,
                  ),
                  SizedBox(height: 20),
                  (state is AuthLoading)
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignUpEvent(
                                username: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                university: universityController.text,
                                image: selectedImage,
                              ),
                            );
                          },
                          child: Text("Sign Up"),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
