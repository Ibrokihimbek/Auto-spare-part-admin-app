import 'dart:async';

import 'package:admin_aplication/data/app_repositroy/info_repository.dart';
import 'package:admin_aplication/data/models/info_model.dart';
import 'package:flutter/cupertino.dart';

class InfoViewModel extends ChangeNotifier {
  final InfoStoreRepository infoStoreRepository;
  InfoViewModel({required this.infoStoreRepository}) {
    listenInfoStore();
  }

  late StreamSubscription subscription;

  List<InfoModel> information = [];

  listenInfoStore() async {
    subscription = infoStoreRepository.getInfo().listen((event) {
      if (event.isNotEmpty) {
        information = event;
        notifyListeners();
      }
    });
  }

  addInformation(InfoModel infoModel) =>
      infoStoreRepository.addInfoStore(infoModel: infoModel);

  updateInformation(InfoModel infoModel) =>
      infoStoreRepository.updateInfoStore(infoModel: infoModel);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
