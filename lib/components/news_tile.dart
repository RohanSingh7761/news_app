import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget leading;
  final void Function()? onTap;
  const NewsTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: Icon(Icons.bookmark),
      onTap: onTap,
    );
  }
}
