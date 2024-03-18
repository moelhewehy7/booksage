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
            builder: (context, imageUrl, child) {
              return CircleAvatar(
                backgroundColor: const Color(0xFFf1f2f3),
                radius: 60,
                // This code checks if imageUrl is not empty and does not start with 'http'
                // (which means it's a local file path) before using Image.file to display the local image.
                //  Otherwise, it uses Image.network to display the image from the URL.
                child: ClipOval(
                  child: imageUrl.isNotEmpty && !imageUrl.startsWith('http')
                      ? Image.file(
                          File(imageUrl),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : ExtendedImage.network(
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
