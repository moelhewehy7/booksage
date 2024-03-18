import 'dart:io';

import 'package:booksage/constants.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class StackedProfilePic extends StatelessWidget {
  const StackedProfilePic({
    super.key,
    required this.size,
    required ValueNotifier<String> imageUrlNotifier,
    required this.userData,
  }) : _imageUrlNotifier = imageUrlNotifier;

  final Size size;
  final ValueNotifier<String> _imageUrlNotifier;
  final Map<String, dynamic>? userData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size.width,
          color: const Color(0xffececec),
          height: size.height * .15,
        ),
        Positioned(
          top: size.height * .15 - 60,
          child: ValueListenableBuilder<String>(
            valueListenable: _imageUrlNotifier,
            // This callback function is called whenever the value of _imageUrlNotifier changes.
            builder: (context, imageUrl, child) {
              // the imageUrl variable is assigned the current value of _imageUrlNotifier.value
              return CircleAvatar(
                backgroundColor: const Color(0xFFf1f2f3),
                radius: 60,
                child: ClipOval(
                  // This is used to display an image from a local file.
                  //  It checks if imageUrl is not empty and does not start with 'http',
                  //   which indicates that it's a local file path.
                  //  If so, it displays the image using Image.file.
                  child: imageUrl.isNotEmpty && !imageUrl.startsWith('http')
                      ? Image.file(
                          File(imageUrl),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ) //else If imageUrl is empty or starts with 'http',
                      : ExtendedImage.network(
                          // if is empty, it means that no image has been selected
                          _imageUrlNotifier.value.isEmpty
                              ? userData!["photoUrl"]
                              : _imageUrlNotifier.value,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.completed:
                                return state.completedWidget;
                              case LoadState.failed:
                                return const Icon(Icons.error);
                              case LoadState.loading:
                                return const Center(
                                  child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: kprimarycolor,
                                    ),
                                  ),
                                );
                            }
                          },
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
