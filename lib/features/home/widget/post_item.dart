import 'package:crud_api/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.post, required this.index, super.key});

  final PostModel post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 12,
          children: [
            Text(
              '${index + 1}. ',
              style: context.textTheme.titleLarge,
            ),
            Flexible(
              child: Text(
                post.title,
                style: context.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Text(
          post.body,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
