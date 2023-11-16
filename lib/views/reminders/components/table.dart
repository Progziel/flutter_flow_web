class ReminderDataTable {
  final String expiry;
  final String id;

  final String email;
  final String number;
  final String count;
  final String status;


  ReminderDataTable({
    required this.id,
    required this.expiry,
    required this.email,
    required this.number,
    required this.status,required this.count
  });
}