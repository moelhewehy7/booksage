import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/presentation/manager/search%20cubit/search_cubit.dart';
import '../../../../../core/utils/widgets/custom_error.dart';
import '../../../../home/presentation/views/widgets/bestsellerlistviewitem.dart';
import '../../../../home/presentation/views/widgets/shimmerbestsellersliverlistitem.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.height,
    required this.width,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
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
                  bookenitity: state.books[i],
                ),
              );
            },
            childCount: state.books.length,
          ));
        } else if (state is SearchFailure) {
          return SliverToBoxAdapter(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomError(errormessage: state.errMessage)));
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
}
