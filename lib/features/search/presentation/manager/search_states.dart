part of 'search_cubit.dart';

@immutable
sealed class SearchStates {}

final class SearchCubitInitial extends SearchStates {}

final class SearchCubitSearchDataLoading extends SearchStates {}

final class SearchCubitSearchDataSuccess extends SearchStates {
  final List<ProductItemModel> resultProducts;

  SearchCubitSearchDataSuccess({required this.resultProducts});
}

final class SearchCubitSearchDataFailure extends SearchStates {}
