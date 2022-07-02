import 'package:equatable/equatable.dart';

abstract class SearchArtistsState extends Equatable{
  const SearchArtistsState();

  @override
  List<Object> get props => [];
}

class SearchArtistsInitial extends SearchArtistsState{}

class SearchArtistsEmpty extends SearchArtistsState{}

class SearchArtistsSuccess extends SearchArtistsState {}
