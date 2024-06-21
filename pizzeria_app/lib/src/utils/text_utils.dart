class TextUtils {
  static String getInitials(String user) {
    final List<String> names = user.split(' ');
    if (names.length == 1) {
      return names[0].substring(0, 2);
    } else {
      return '${names[0].substring(0, 1)}${names[1].substring(0, 1)}';
    }
  }
}
