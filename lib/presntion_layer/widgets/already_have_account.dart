import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key, this.login = true, required this.onTap})
      : super(key: key);
  final bool login;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'ليس لديك حساب ؟' : ' لديك حساب بالفعل ؟',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.greyColor),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            login ? 'انشاء حساب' : 'تسجيل دخول ',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold, color: AppColor.pinkColor),
          ),
        )
      ],
    );
  }
}
