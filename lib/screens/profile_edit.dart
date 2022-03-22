import 'dart:io';

import 'package:avatar/providers/user_provider.dart';
import 'package:avatar/screens/home_page.dart';
import 'package:avatar/widgets/color_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _descController = TextEditingController();

  File? imageFile;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      imageFile = imageTemp;
    });
  }

  submitForm() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _countryController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _descController.text.isEmpty) {
      debugPrint('Error Here');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('Please Fill All the Fields!!!'),
            backgroundColor: Theme.of(context).errorColor),
      );
      return;
    }
    Map<String, dynamic> user = {
      "name": _nameController.text,
      "email": _emailController.text,
      "contactNo": _contactController.text,
      "country": _countryController.text,
      "city": _cityController.text,
      "description": _descController.text,
      "image": imageFile,
    };
    debugPrint('Success Here');
    Provider.of<UserProvider>(context, listen: false).createDetailUser(user);
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (ctx) => const HomePage()));
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Center(
            widthFactor: 3.5,
            child: Text(
              'Edit Info',
              style: TextStyle(
                  color: editAppHeadColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: backgroundColor),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 13),
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Container(
                    height: 148,
                    width: 132,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: imageFile == null
                        ? Image.asset('assets/images/start_image.png')
                        : Image.file(imageFile!)),
                const SizedBox(width: 15),
                OutlinedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text(
                    'Upload New Photo',
                    style: TextStyle(color: uploadButtonColor),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: uploadButtonColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onSurface: uploadButtonColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'About Me',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          textfield('Name', _nameController),
          textfield('Email', _emailController),
          textfield('Contact No', _contactController),
          textfield('Country', _countryController),
          textfield('City I\'m In*', _cityController),
          textfield('What I am Currently Doing', _descController),

          const SizedBox(height: 30),
          Container(
            height: 40,
            width: 328,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // stops: [0.0, 1.0],
                colors: [
                  Color(0xFF7A62F8),
                  Color(0xFF630BFF),
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                submitForm();
              },
              child: const Text(
                'Save',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.transparent),
            ),
          )
        ]),
      ),
    );
  }

  textfield(String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.all(0),
          label: Text(
            text,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
