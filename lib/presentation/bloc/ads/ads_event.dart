part of 'ads_bloc.dart';

sealed class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}


final class FetchAdsEvent extends AdsEvent {
  const FetchAdsEvent();

  @override
  List<Object> get props => [];

}