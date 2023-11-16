class AdminModel {
  String name;
  DateTime joinedDate;
  String subscription;
  bool isSubscriptionPaid;

  AdminModel({
    required this.name,
    required this.joinedDate,
    required this.subscription,
    this.isSubscriptionPaid = false,
  });
}
