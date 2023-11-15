class UserModel {
  final String name;
  final String email;
  final String number;

  UserModel({
    required this.name,
    required this.email,
    required this.number,
  });
}

final List<UserModel> users = [
  UserModel(
    name: 'John Doe',
    email: 'john.doe@example.com',
    number: '123-456-7890',
  ),
  UserModel(
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
    number: '987-654-3210',
  ),
  UserModel(
    name: 'Bob Johnson',
    email: 'bob.johnson@example.com',
    number: '555-123-4567',
  ),
];
