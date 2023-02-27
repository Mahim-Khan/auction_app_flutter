import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/const.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(kRUSure),
      content: const Text(kDUWantExt),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(kExit),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(kCan),
            ),
          ],
        ),
      ],
    );
  }
}