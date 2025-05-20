import 'package:cars_store/feature/favorite/domain/entity/favorite_cars_entity.dart';
import 'package:cars_store/feature/favorite/presentation/views/widgets/favorite_item.dart';
import 'package:flutter/widgets.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key, required this.carsEntity});
  final List<FavoriteCarsEntity> carsEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carsEntity.length,
      itemBuilder:
          (context, index) => FavoriteItem(carsEntity: carsEntity[index]),
    );
  }
}
