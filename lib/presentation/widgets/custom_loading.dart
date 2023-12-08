import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => SizedBox(
      child: Center(
        child: Container(
          width: 200,
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
              Text(
                'Please wait',
                style: TextStyle(
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
