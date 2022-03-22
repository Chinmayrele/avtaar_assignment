import 'dart:io';

class User {
  final String name;
  final String email;
  final String contactNo;
  final String country;
  final String city;
  final String description;
  final File? image;

  User({
    this.name = 'John Doe',
    this.email = 'test@test.com',
    this.contactNo = '1234567890',
    this.country = 'India',
    this.city = 'Mumbai',
    this.description = 'Studying Btech',
    this.image,
  });
}
