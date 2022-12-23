import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextKota extends StatelessWidget {
  const TextKota({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMd().format(DateTime.now()),
    );
  }
}
