/*
! this is for apps, that use BLoC/Cubit


/// 🧩 [OverlayStatusCubit] — Manages current overlay visibility state.
/// ✅ Used to propagate `isOverlayActive` from [OverlayDispatcher] to UI logic (e.g., disabling buttons).
//
final class OverlayStatusCubit extends Cubit<bool> {
  ///---------------------------------------------
  //
  OverlayStatusCubit() : super(false);
  void updateStatus(bool isActive) => emit(isActive);
  //
}

////

////

/// 🧠 [OverlayStatusX] — Extension for accessing overlay activity status from [BuildContext].
/// ⚠️ Note: For read-only checks only. For reactive usage, prefer listening to [OverlayStatusCubit] via BlocBuilder
//
extension OverlayStatusX on BuildContext {
  bool get overlayStatus => read<OverlayStatusCubit>().state;
}



 */
