import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/book_model.dart';


class BookButton extends StatelessWidget {
  const BookButton({
    super.key, required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width*.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
          ),
          child: const Center(
            child: Text(
              "Free",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            Uri uri=Uri.parse(book.volumeInfo!.previewLink!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          child: Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width*.4,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: const Center(
              child: Text(
                "Free Preview",
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
