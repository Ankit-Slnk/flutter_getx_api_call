import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/models/users_response.dart';
import 'package:flutter_getx_api_call/utils/app_colors.dart';
import 'package:flutter_getx_api_call/utils/utility.dart';
import 'package:flutter_getx_api_call/widgets/image_loader.dart';

class UserItemView extends StatelessWidget {
  final UserDetails user;
  const UserItemView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 50,
              width: 50,
              child: ImageLoader(url: user.avatar!),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.firstName!} ${user.lastName!}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(user.email!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
