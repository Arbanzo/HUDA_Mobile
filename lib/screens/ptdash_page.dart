import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class Patient {
  String name;
  int age;
  String phone;
  File? profilePicture;

  Patient({
    required this.name,
    required this.age,
    required this.phone,
    this.profilePicture,
  });
}

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  Future _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _patient?.profilePicture = File(pickedFile.path);
      });
    }
  }

  bool isEditing = false;

  Patient? _patient;

  @override
  void initState() {
    super.initState();

    _patient = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/home');
          },
        ),
        title: const Text('Patient Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: _patient?.profilePicture != null
                          ? FileImage(_patient!.profilePicture!)
                              as ImageProvider<Object>?
                          : const AssetImage('lib/assets/huda_logo.png'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: !isEditing,
                    child: Text(
                      'Name: ${_patient?.name ?? 'Luke'}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  Visibility(
                    visible: !isEditing,
                    child: const SizedBox(height: 10),
                  ),
                  Visibility(
                    visible: !isEditing,
                    child: Text(
                      'Age: ${_patient?.age ?? '21'}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Visibility(
                    visible: !isEditing,
                    child: const SizedBox(height: 10),
                  ),
                  Visibility(
                    visible: !isEditing,
                    child: Text(
                      'Phone: ${_patient?.phone ?? '1234567890'}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Visibility(
                    visible: isEditing,
                    child: TextFormField(
                      initialValue: _patient?.name ?? 'Luke',
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        if (_patient == null) {
                          _patient = Patient(name: value!, age: 0, phone: '');
                        } else {
                          _patient!.name = value!;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: isEditing,
                    child: const SizedBox(height: 10),
                  ),
                  Visibility(
                    visible: isEditing,
                    child: TextFormField(
                      initialValue: _patient?.age.toString() ?? '21',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        if (_patient != null) {
                          _patient!.age = int.tryParse(value!)!;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an age';
                        }
                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: isEditing,
                    child: const SizedBox(height: 10),
                  ),
                  Visibility(
                    visible: isEditing,
                    child: TextFormField(
                      initialValue: _patient?.phone ?? '1234567890',
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        if (_patient != null) {
                          _patient!.phone = value!;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text(isEditing ? 'Save Profile' : 'Edit Profile'),
                    onPressed: () {
                      if (isEditing) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            isEditing = false;
                          });
                        }
                      } else {
                        setState(() {
                          isEditing = true;
                        });
                      }
                    },
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
