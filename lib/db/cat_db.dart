import 'package:hive/hive.dart';
import 'package:novalabtask/model/cat_model.dart';
import 'package:novalabtask/network/network_config.dart';
import 'package:novalabtask/service/cat_service.dart';
import 'package:path_provider/path_provider.dart';

class CatDB {
  Box<CatModel>? catBox;

  // Get instance from CatService
  final CatService _catService = CatService();

  // Call service
  Future<dynamic> getRandomCat() async {
    NetworkResponses response = await _catService.getCats();
    if (response is NetworkSuccessResponses) {
      await openBox();
      await writeToBox(response.model as CatModel); // send model data
      // Check box availability
      if (catBox!.isNotEmpty && catBox != null) {
        return response.model as CatModel;
      } else {
        return "Ma'lumotlar mavjud emas";
      }
    } else {
      return (response as NetworkExceptionError).exceptionMessage;
    }
  }

  dynamic getAllCats() async {
    await openBox();
    if (catBox!.isNotEmpty && catBox != null) {
      return catBox!.values.toList();
    } else {
      return "Cats are not found";
    }
  }

  // Open box
  Future<void> openBox() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    catBox = await Hive.openBox<CatModel>("cat");
  }

  //Register Adapters
  void registerBoxAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CatModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(StatusAdapter());
    }
  }

  // Write to Box
  Future<void> writeToBox(CatModel data) async {
    await catBox!.add(data);
  }

  // Delete from box
  static Future<void> deleteBox() async {
    await Hive.deleteBoxFromDisk("cat");
    return;
  }
}
