import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TagChip extends StatelessWidget {
  final String tagName;

  const TagChip({
    super.key,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/tags/$tagName'),
      child: Chip(
        label: Text(tagName),
        backgroundColor: const Color(0xFFF9A825),
      ),
    );
  }
}