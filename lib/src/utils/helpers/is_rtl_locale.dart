import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

bool isDirectionRTL(BuildContext context) {
  return intl.Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
}
