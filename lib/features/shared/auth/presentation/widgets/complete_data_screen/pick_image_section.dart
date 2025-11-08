import 'dart:io';

import 'package:doktory/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickImageSection extends StatefulWidget {
  final void Function(File? imageFile) onImagePicked;

  const PickImageSection({required this.onImagePicked, super.key});

  @override
  State<PickImageSection> createState() => _PickImageSectionState();
}

class _PickImageSectionState extends State<PickImageSection> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImagePicked(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundColor: Colors.grey[200],
            backgroundImage: _selectedImage != null
                ? FileImage(_selectedImage!)
                : null,
            child: _selectedImage == null
                ? Icon(Icons.person, size: 50.r, color: Colors.grey)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 2.w,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.edit, color: Colors.white, size: 15.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
