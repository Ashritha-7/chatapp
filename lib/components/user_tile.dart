import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  

  const UserTile({
    Key? key,
    required this.text,
    required this.onTap,
  }); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                margin: EdgeInsets.only(right: 8),
                child: const Icon(Icons.person),
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
