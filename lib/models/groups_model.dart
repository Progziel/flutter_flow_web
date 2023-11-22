import 'user_model.dart';

class GroupModel {
  final String name;
  final List<UserModel> groupUsers;

  GroupModel({
    required this.name,
    required this.groupUsers,s
  });
}

// final List<UserModel> users = [
//   UserModel(
//     name: 'John Doe',
//     email: 'john.doe@example.com',
//     number: '123-456-7890',
//   ),
//   UserModel(
//     name: 'Jane Smith',
//     email: 'jane.smith@example.com',
//     number: '987-654-3210',
//   ),
//   UserModel(
//     name: 'Bob Johnson',
//     email: 'bob.johnson@example.com',
//     number: '555-123-4567',
//   ),
// ];
