class NumberUtils {
  static String generateOrderNumber(String lastNumber) {
    // Get the current date in the format YYYYMMDD
    final currentDate =
        DateTime.now().toLocal().toString().split(' ')[0].replaceAll('-', '');

    // Read the last order number from a file or database
    var lastOrderNumber = int.parse(lastNumber);

    // Increment the order number
    if (lastOrderNumber == 0 ||
        currentDate != lastOrderNumber.toString().substring(0, 8)) {
      // Reset the order number to 1 for a new day
      lastOrderNumber = int.parse('$currentDate' '1');
    } else {
      // Increment the order number for the same day
      lastOrderNumber += 1;
    }

    return lastOrderNumber.toString();
  }
}
