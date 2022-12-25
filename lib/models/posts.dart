import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../models/IURPost_model.dart';
import '../core/image_root.dart';
import 'random_image_generator.dart';

final homeScreenController = Get.put(HomeScreenController());

List<IURPostModel> postsSamples = [
  IURPostModel(
    iURPostModelPageController: homeScreenController.pageControllerExample1,
    postId: 1,
    authorName: 'Diva',
    authorImgPath: ImageRoot.divaLogo,
    imgPaths: <String>[
      RandomImageGenerator.randomImage(),
      RandomImageGenerator.randomImage(),
      RandomImageGenerator.randomImage(),
    ],
    title: "Diva",
    description: ''' اليوم بتفاصيلة ميكملش غير ب ديفا 👰🏻❤️
من أول مناقشتنا معاكي لاختيار اللوك المناسب 
ليكي لحد اللحظة اللي بتبصي فيها في مرايتك وتلاقي قمر منور 👌🏻🤍 
متنسيش تسألينا ع تفاصيل حجز الميك اب الفرح والحنة ''',
    tags: <String>["space"],
    timeOfPublish: DateTime.now().subtract(
      const Duration(minutes: 27),
    ),
  ),
  IURPostModel(
    iURPostModelPageController: homeScreenController.pageControllerExample2,
    postId: 1,
    authorName: 'Diva',
    authorImgPath: ImageRoot.divaLogo,
    imgPaths: <String>[
      RandomImageGenerator.randomImage(),
      RandomImageGenerator.randomImage(),
      RandomImageGenerator.randomImage(),
    ],
    title: "Diva",
    description: ''' اليوم بتفاصيلة ميكملش غير ب ديفا 👰🏻❤️
من أول مناقشتنا معاكي لاختيار اللوك المناسب 
ليكي لحد اللحظة اللي بتبصي فيها في مرايتك وتلاقي قمر منور 👌🏻🤍 
متنسيش تسألينا ع تفاصيل حجز الميك اب الفرح والحنة ''',
    tags: <String>["space"],
    timeOfPublish: DateTime.now().subtract(
      const Duration(minutes: 27),
    ),
  ),
];
