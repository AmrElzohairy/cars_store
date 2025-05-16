import 'package:bloc/bloc.dart';
import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:equatable/equatable.dart';

part 'featured_cars_state.dart';

class FeaturedCarsCubit extends Cubit<FeaturedCarsState> {
  FeaturedCarsCubit() : super(FeaturedCarsInitial());
}
