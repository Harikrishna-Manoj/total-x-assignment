import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: searchcontroller,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Image.asset(
            'assets/image/icons/search_icon.png',
            scale: 4,
          ),
          // filled: true,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: 'Search',
          hintStyle:
              const TextStyle(fontSize: 15, height: 1.5, color: Colors.black)),
      onChanged: (value) {},
    );
  }
}
