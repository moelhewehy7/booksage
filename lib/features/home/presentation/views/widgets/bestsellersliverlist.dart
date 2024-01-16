import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/core/utils/widgets/custom_error.dart';
import 'package:reading/features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:reading/features/home/presentation/views/widgets/shimmerbooklistviewitem.dart';
import 'package:shimmer/shimmer.dart';

import 'bestsellerlistviewitem.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            //This approach ensures that only the visible items are rendered
            (BuildContext context, int i) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: BestSellerSliverListItem(
                  height: height,
                  width: width,
                  bookmodel: state.books[i],
                ),
              );
            },
            childCount: state.books.length,
          ));
        } else if (state is NewestBooksFailure) {
          return CustomError(errormessage: state.errMessage);
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ShimmerBestSellerSliverListItem(
                      height: height, width: width),
                );
              },
              childCount: 5,
            ),
          );
        }
      },
    );
  }

  Shimmer shimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: SizedBox(
        height: height * 0.3,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 6, right: 10),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 2, top: 6),
              child: ShimmerBookListViewItem(
                  width: width * 0.35, height: height * 0.3),
            );
          },
        ),
      ),
    );
  }
}

class ShimmerBestSellerSliverListItem extends StatelessWidget {
  const ShimmerBestSellerSliverListItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: GestureDetector(
        onTap: () {
          // Handle tap on shimmer item
        },
        child: SizedBox(
          height: height * 0.16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: width * 0.20,
                height: height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.grey, // Adjust the color as needed
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: width * .04, // Adjust the height as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    Container(
                      height: width * .04, // Adjust the height as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * .07, // Adjust the width as needed
                          height: height * .020, // Adjust the height as needed
                          color: Colors.grey, // Adjust the color as needed
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: width * .07, // Adjust the width as needed
                          height: height * .020, // Adjust the height as needed
                          color: Colors.grey, // Adjust the color as needed
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
