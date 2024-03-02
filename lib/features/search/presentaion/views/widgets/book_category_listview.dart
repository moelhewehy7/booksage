import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:reading/features/search/presentaion/views/widgets/book_category_card.dart';

class BookCategoryListView extends StatefulWidget {
  const BookCategoryListView({super.key});

  @override
  State<BookCategoryListView> createState() => _BookCategoryListView();
}

int currentIndex = 0;
List<String> categories = [
  'General',
  'Fiction',
  'Non-Fiction',
  'Science Fiction',
  'Mystery',
  'Fantasy',
  'Religious',
  'Historical Fiction',
  'Biographies',
  'Classic Literature',
  'Sports',
  'Poetry',
  'Drama',
  'Horror',
  'Cookbooks',
  'Travel',
  'Nature and Environment',
  'Business and Finance',
  'Anime',
];

class _BookCategoryListView extends State<BookCategoryListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return BookCategoryCard(
          onpressed: () {
            currentIndex = index;
            setState(() {});
            BlocProvider.of<SearchCubit>(context)
                .fetchBookbysearch(book: categories[index]);
          },
          category: categories[index],
          isActive: currentIndex == index,
        );
      },
    );
  }
}
