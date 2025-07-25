import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BookingStore {
  static Future<void> saveBooking(
    String ground,
    String date,
    String time,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final booking = {'ground': ground, 'date': date, 'time': time};

    List<String> bookings = prefs.getStringList('bookings') ?? [];
    bookings.add(jsonEncode(booking));
    await prefs.setStringList('bookings', bookings);
  }

  static Future<List<Map<String, dynamic>>> getBookings() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookings = prefs.getStringList('bookings') ?? [];
    return bookings
        .map((e) => jsonDecode(e))
        .cast<Map<String, dynamic>>()
        .toList();
  }

  static Future<void> clearBookings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bookings');
  }
}
