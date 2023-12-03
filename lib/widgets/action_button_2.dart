import 'package:flutter/material.dart';

//stateless widget
class ActionButton2 extends StatelessWidget {
  final String? action;
  final VoidCallback? onPressed;
  final String icon;
  //constructor
  const ActionButton2(
      {Key? key,
      required this.action,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //button container
      height: 50,
      width: 200,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      //button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icon), // replace with your image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              action!,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Imprima',
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
