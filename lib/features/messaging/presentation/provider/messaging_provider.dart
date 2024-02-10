import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';
import 'package:wallnex/features/messaging/domain/usecase/serch_user_in_firebase.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecase/get_a_message.dart';
import '../../domain/usecase/get_from_history.dart';
import '../../domain/usecase/send_a_message.dart';
import '../../domain/usecase/set_to_history.dart';

class MessagingProvider extends ChangeNotifier {
  final SearchUserInFirebase _searchUserInFirebase;
  final SetToHistory _setToHistory;
  final GetFromHistory _getFromHistory;
  final SendMessage _sendMessage;
  final GetMessage _getMessage;

  MessagingProvider(this._searchUserInFirebase, this._setToHistory,
      this._getFromHistory, this._sendMessage, this._getMessage);

  bool isLoading = false;
  SearchUser searchUser = SearchUser.initialData();
  List<SearchUser> history = [];
  List<Message> messages = [];

  Future<void> searchUserInDatabase(String query) async {
    isLoading = true;
    notifyListeners();

    final searchResult =
        await _searchUserInFirebase.call(ParamsString(params: query));

    searchResult.fold((l) => l, (r) {
      searchUser = r;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> setToHistory(SearchUser searchUser) async {
    await _setToHistory.call(ParamsSearchUser(params: searchUser));
  }

  Future<void> getFromHistory() async {
    isLoading = true;
    notifyListeners();

    final result = await _getFromHistory.call(NoParams());

    result.fold((l) => l, (r) {
      history = r;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> sendMessage(String receiverId, String message) async {
    await _sendMessage
        .call(ParamsMultiString(params: receiverId, params1: message));
  }

  Future<void> getMessage(String uId, String sUid) async {
    final result =
        await _getMessage.call(ParamsMultiString(params: uId, params1: sUid));
    result.fold((l) => l, (r) {
      messages = r;
      isLoading = false;
      notifyListeners();
    });
  }
}
