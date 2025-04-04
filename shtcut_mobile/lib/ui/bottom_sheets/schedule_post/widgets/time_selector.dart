import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSelector extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeChanged;

  const TimeSelector({
    Key? key,
    required this.initialTime,
    required this.onTimeChanged,
  }) : super(key: key);

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  late TimeOfDay _selectedTime;
  late bool _isPm;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
    _isPm = _selectedTime.hour >= 12;
  }

  void _toggleAmPm() {
    setState(() {
      _isPm = !_isPm;

      // Convert the hour based on AM/PM toggle
      int newHour;
      if (_isPm) {
        // Converting to PM
        newHour = _selectedTime.hour < 12
            ? _selectedTime.hour + 12
            : _selectedTime.hour;
      } else {
        // Converting to AM
        newHour = _selectedTime.hour >= 12
            ? _selectedTime.hour - 12
            : _selectedTime.hour;
      }

      _selectedTime = TimeOfDay(hour: newHour, minute: _selectedTime.minute);
      widget.onTimeChanged(_selectedTime);
    });
  }

  void _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _isPm = pickedTime.hour >= 12;
        widget.onTimeChanged(_selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format hour for 12-hour display
    int displayHour = _selectedTime.hour > 12
        ? _selectedTime.hour - 12
        : _selectedTime.hour == 0
            ? 12
            : _selectedTime.hour;

    // Format minute with leading zero if needed
    String displayMinute = _selectedTime.minute < 10
        ? '0${_selectedTime.minute}'
        : '${_selectedTime.minute}';

    return Row(
      children: [
        // Time tile (74x36)
        GestureDetector(
          onTap: _showTimePicker,
          child: Container(
            width: 74.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: const Color(0xFF767680).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                '$displayHour:$displayMinute',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 8.w),

        // AM/PM toggle tile
        GestureDetector(
          onTap: _toggleAmPm,
          child: Container(
            height: 36.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF767680).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                _isPm ? 'PM' : 'AM',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
