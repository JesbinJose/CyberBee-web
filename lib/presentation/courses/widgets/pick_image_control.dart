import 'dart:typed_data';

import 'package:cyberbee_web/application/image/pick_image.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class PickImageControl extends StatelessWidget {
  const PickImageControl({
    super.key,
    required this.intoImageLink,
    this.urlImageLink,
  });
  final ValueNotifier<Uint8List?> intoImageLink;
  final String? urlImageLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 10,
        ),
        ValueListenableBuilder(
          valueListenable: intoImageLink,
          builder: (___, _, __) {
            return Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                //checking to show which image
                child: intoImageLink.value != null
                    ? Image.memory(
                        intoImageLink.value!,
                        fit: BoxFit.cover,
                      )
                    : urlImageLink != null
                        ? Image.network(
                            urlImageLink!,
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Text(
                              'No image selected',
                            ),
                          ),
              ),
            );
          },
        ),
        const Expanded(
          child: SizedBox(),
        ),
        ValueListenableBuilder(
          valueListenable: intoImageLink,
          builder: (__, v, _) {
            return CustomTextButton(
              onTap: () => PickProfilePicture.pickImage(context).then(
                (value) {
                  if (value != null) {
                    intoImageLink.value = value;
                  }
                },
              ),
              content: v == null ? 'Pick Image' : 'Change Image',
            );
          },
        ),
      ],
    );
  }
}
