import 'package:flutter/material.dart';
import 'package:groundapp/model/ground.dart';
import 'package:groundapp/screen/booking_store.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final List<Ground> grounds;

  const BookingScreen({super.key, required this.grounds});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _dateController = TextEditingController();

  DateTime? selectedDate;
  String? selectedSlot;
  Ground? selectedGround;

  Future<void> _confirmBooking() async {
    if (selectedDate == null || selectedSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date and time slot')),
      );
      return;
    }
    // final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    // for storing the booking slot

    // await BookingStore.saveBooking(
    //   selectedGround!.name,
    //   formattedDate,
    //   selectedSlot!,
    // );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text(
              'Booking Confirmed',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            content: Text(
              "You  have booked ${selectedGround?.name} on "
              "${DateFormat('yyyy-MM-dd').format(selectedDate!)} at $selectedSlot",
            ),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Slot booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            DropdownButtonFormField<Ground>(
              decoration: InputDecoration(
                hintText: 'Select Ground',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items:
                  widget.grounds.map((ground) {
                    return DropdownMenuItem(
                      value: ground,
                      child: Text(ground.name),
                    );
                  }).toList(),
              value: selectedGround,
              onChanged:
                  (ground) => setState(() {
                    selectedGround = ground;
                    selectedSlot = null;
                  }),
            ),

            SizedBox(height: 20),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                labelText: ' Date',
                hintText: 'Select Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 7)),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                    _dateController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(picked);
                  });
                }
              },
            ),

            const SizedBox(height: 20),
            // Time slot Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintText: 'Select Time Slot',
              ),
              items:
                  (selectedGround?.availableSlots ?? []).map((slot) {
                    return DropdownMenuItem(value: slot, child: Text(slot));
                  }).toList(),
              value: selectedSlot,
              onChanged:
                  selectedGround == null
                      ? null
                      : (val) => setState(() => selectedSlot = val),
            ),
            // Spacer(),
            SizedBox(height: 30),

            // if (selectedGround != null &&
            //     selectedDate != null &&
            //     selectedSlot != null)
            // Card(
            //   elevation: 4,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   margin: const EdgeInsets.symmetric(
            //     vertical: 20,
            //     horizontal: 20,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           "Booking Preview",
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.blueAccent,
            //           ),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           " Ground: ${selectedGround!.name}",
            //           style: const TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           " Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}",
            //           style: const TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           "Time: $selectedSlot",
            //           style: const TextStyle(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                elevation: 3,
              ),

              onPressed: () {
                _confirmBooking();
              },
              child: Text(
                'Confirm Booking',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
