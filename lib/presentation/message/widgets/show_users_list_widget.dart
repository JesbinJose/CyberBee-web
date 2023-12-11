import 'package:flutter/material.dart';

class ShowUsersChatWidget extends StatelessWidget {
  const ShowUsersChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: SizedBox(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
