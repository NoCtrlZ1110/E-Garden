import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:e_garden/core/view_model/dictionary_model.dart';

List<SingleChildWidget> getProviders() {
  var independentServices = [
    ChangeNotifierProvider(
      create: (context) => DictionaryModel(),
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
