import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  bool isTextField = false;

  String name = 'John Conte';
  String email = 'johnconte@gmail.com';
  String number = '+977 9860749124';
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: name);
    _emailController = TextEditingController(text: email);
    _numberController = TextEditingController(text: number);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      name = _nameController.text;
      email = _emailController.text;
      number = _numberController.text;
      isTextField = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.58,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('images/profile.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {}
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isTextField
                            ? Expanded(
                                child: TextField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              )
                            : Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isTextField = true;
                            });
                          },
                          icon: const Icon(
                            Icons.edit,
                          ),
                        )
                      ]),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isTextField
                          ? Expanded(
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            )
                          : Text(
                              email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isTextField = true;
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isTextField
                          ? Expanded(
                              child: TextField(
                                controller: _numberController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            )
                          : Text(
                              number,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isTextField = true;
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (isTextField)
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(70, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  _saveChanges();
                },
                child: const Text('Save'),
              ),
          ],
        ),
      ),
    );
  }
}
