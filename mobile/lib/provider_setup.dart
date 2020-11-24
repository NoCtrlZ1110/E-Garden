import 'package:e_garden/core/services/dictionary/dictionary_model.service.dart';
import 'package:e_garden/core/services/translate/translate_model.service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  var independentServices = [
    ChangeNotifierProvider(
      create: (context) => DictionaryModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => TranslateModel(),
    ),
  ];

  var dependentServices = [

  ];

  return [
    ...independentServices,
    ...dependentServices,
//     ...uiConsumableProviders
  ];
}
