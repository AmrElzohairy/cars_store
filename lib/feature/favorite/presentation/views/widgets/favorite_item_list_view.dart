import 'package:cars_store/feature/favorite/presentation/views/widgets/favorite_item.dart';
import 'package:flutter/widgets.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const FavoriteItem(),
    );
  }
}
