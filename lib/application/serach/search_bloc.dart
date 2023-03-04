import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/search/search_service.dart';
import 'package:dartz/dartz.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_responce/search_responce.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';


@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SerachService _serachService;
  SearchBloc(this._downloadsService, this._serachService)
      : super(SearchState.initial()) {
    /* 
    search idle state
    */
    on<Initialize>((event, emit) async{
      // get trending
    final _result =  _downloadsService.getDownloadsImages();
    
     
      // show to ui
    });
    /* 
    search result state
    */
    on<SearchMovie>((event, emit) {
      // call search movie api
      _serachService.searchMovies(movieQuery: event.movieQuery);
      // show to ui
    });
  }
}
