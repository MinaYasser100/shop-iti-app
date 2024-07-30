part of 'layout_screen_cubit.dart';

@immutable
sealed class LayoutScreenState {}

final class LayoutScreenInitial extends LayoutScreenState {}

final class LayoutScreenChangeBodyScreen extends LayoutScreenState {}
