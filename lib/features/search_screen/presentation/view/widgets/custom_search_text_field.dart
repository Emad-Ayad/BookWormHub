import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const CustomSearchTextField({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                hintText: 'Search',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search))),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
