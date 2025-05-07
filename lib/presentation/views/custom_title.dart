import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const CustomTitle({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                backgroundColor: WidgetStatePropertyAll(Color(0xFFF46417)),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: Text(
                subTitle!,
                style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
