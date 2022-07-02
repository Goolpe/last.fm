import 'package:equatable/equatable.dart';

abstract class SearchArtistsState extends Equatable{
  const SearchArtistsState();

  @override
  List<Object> get props => [];
}

class SearchArtistsStateInitial extends SearchArtistsState{}

class SearchArtistsStateEmpty extends SearchArtistsState{}

class SearchArtistsStateSuccess extends SearchArtistsState {}
