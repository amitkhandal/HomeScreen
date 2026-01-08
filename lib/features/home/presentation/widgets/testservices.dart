import 'package:flutter/material.dart';

class TestServices extends StatelessWidget {
  final String? imagePath;
  final String? description;
  final String? name;

  const TestServices({super.key, this.imagePath, this.description, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Image.asset(imagePath ?? "",height: 100,width: 80,),
            const SizedBox(height: 2),
            Text(name ?? "",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
            const SizedBox(height: 2),
            Text(description ?? "",style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
