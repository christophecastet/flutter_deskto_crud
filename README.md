### Installer, lancer, builder Flutter Desktop App

doc : https://docs.flutter.dev/development/platform-integration/desktop

pour Windows (CLI):

- flutter config --enable-windows
- flutter create my_app
- flutter run -d windows
- flutter build windows

### Exemple de CRUD Bloc archi

doc : https://docs.hivedb.dev/#/

library utilisées:

- hive: ^2.2.3
- hive_flutter: ^1.1.0
- hive_generator: ^2.0.0
- bloc: ^8.1.0
- flutter_bloc: ^8.1.1

## archi

lib/
---/model/
---------------/mon_model.model.dart
---------------/mon_model.model.g.dart (fichier auto généré)
---/maFeature/
--------------/data/
-----------------------------/data-source/
-----------------------------------------/user.hive.dart
-----------------------------/dto/
-----------------------------------------/dto_ma_feature.parser.dart
-----------------------------------------/ma_feature.dto.dart
-----------------------------------------/ma_feature.dto.g.dart (fichier auto généré)
-----------------------------/repository/
----------------------------------------/ma-feature.repository.dart
--------------/domain/
-----------------------------/service/
--------------------------------------/ma_feature.service.dart
-----------------------------/entity/
--------------------------------------/ma_feature.entity.dart
--------------/presentation/
-----------------------------/bloc/
--------------------------------------/ma_feature.cubit.dart
--------------------------------------/ma_feature.state.dart
-----------------------------/widget/
-----------------------------/ma_feature.page.dart

## Création du model

- créer le dossier model à la racine de lib
- créer le fichier mon_model.model.dart
- dans le fichier créé ajouter la class tel que:

import 'package:hive/hive.dart';
part 'mon_model.g.dart';

@HiveType(typeId: 1) //@HiveType with a unique typeId argument
class MonModel {
@HiveField(0)
String field_1;
@HiveField(1)
int field_2;
}

- Run build task : flutter packages pub run build_runner build // cela générera mon_model.model.g.dart
# flutter_deskto_crud
