import 'package:flutter/material.dart';

class MyCustomSmallButton extends StatelessWidget {
  final String content;
  final VoidCallback function;
  const MyCustomSmallButton({
    super.key,
    required this.content,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          content,
          // style: MyTextStyles.h5.copyWith(
          //   color: MyColors.textWhiteColor,
          // ),
        ),
      ),
    );
  }
}
