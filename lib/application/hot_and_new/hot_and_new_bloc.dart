import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hotandnew movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to Ui

      emit(const HotAndNewState(
        comingSoonList: [],
        evreyOneIsWathingList: [],
        isLoading: true,
        hasError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          evreyOneIsWathingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoonList: resp.results,
          evreyOneIsWathingList: state.evreyOneIsWathingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
    //get hotandnew tv data
    on<LoadDataInEvereyOneWatching>((event, emit) async{
      //send loading to Ui

      emit(const HotAndNewState(
        comingSoonList: [],
        evreyOneIsWathingList: [],
        isLoading: true,
        hasError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();

      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          evreyOneIsWathingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoonList:state.comingSoonList,
          evreyOneIsWathingList: resp.results,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
