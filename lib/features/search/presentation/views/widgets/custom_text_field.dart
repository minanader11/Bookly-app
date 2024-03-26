import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
    return TextField(
      controller: textEditingController ,
      onChanged: (value) {
       //if(value== null){
       //  BlocProvider.of<SearchBooksCubit>(context).emit(SearchBooksLoading());
      //   textEditingController.dispose();
      // }
      // BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks(category: value);
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: 'Search',
        suffixIcon: IconButton(onPressed: (){
          BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks(category: textEditingController.text);
        }, icon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 24,
        ),)
      ),
    );
  }
}