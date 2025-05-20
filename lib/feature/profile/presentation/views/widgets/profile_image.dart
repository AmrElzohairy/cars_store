import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/media_query_size.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesProfilrMockUp,
      height: height(context) * 0.15,
    );
  }
}
