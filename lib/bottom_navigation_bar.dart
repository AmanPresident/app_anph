import 'EcranTrois.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 5, 65, 114),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: IconButton(
        icon:
            Icon(Icons.home, color: Color.fromARGB(255, 219, 133, 4), size: 30),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EcranTrois(),
            ),
          );
        },
      ),
    );
  }
}
