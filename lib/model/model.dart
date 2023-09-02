class Expense {
  final DateTime date;
  final String category;
  final double amount;
  final String description;
  final String iconCategory;

  Expense(
      {
      required this.date,
      required this.category,
      required this.amount,
      required this.description,
      required this.iconCategory
      });
}
