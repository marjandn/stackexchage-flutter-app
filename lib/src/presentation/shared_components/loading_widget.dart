import 'package:flutter/cupertino.dart';

Widget loadingWidget() => const Center(
      child: CupertinoActivityIndicator(),
    );

Widget failedWidget([String text = "Somtehing went wrong!"]) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ic_empty.png",
            width: 66,
            height: 66,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(text),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
