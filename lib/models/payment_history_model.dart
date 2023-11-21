class PaymentHistoryModel {
  final String paymentInvoice;
  final double amount;
  final DateTime date;
  final String status;
  bool selected;

  PaymentHistoryModel({
    required this.paymentInvoice,
    required this.amount,
    required this.date,
    required this.status,
    this.selected = false,
  });
}
