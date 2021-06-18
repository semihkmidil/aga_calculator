part of '../form_validator_view_model.dart';

extension DateTimess on Base{
  DateTime get todayDateTime=>DateTime.now().toLocal();
  DateTime get today=>DateTime(todayDateTime.year, todayDateTime.month, todayDateTime.day);
  DateTime get hundredYearsAgo=>today.subtract(Duration(days: 36500+365, hours: 600+5, minutes: 59, seconds: 59));
}