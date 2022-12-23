import '../core/image_root.dart';

class InstagramView {
  final String urlImage;
  final String title;

  InstagramView({required this.title, required this.urlImage});
}

List<InstagramView> InstagramList = [
  InstagramView(title: ''' شكلك مميز ✨
اللوك لايق عليكي ♥️
فستانك يجنن 🥰
كل الكلام ده وأكتر كمان هتسمعيه يوم فرحك بعد ما تختاري فستانك والميك اب مع ديفا 😉
احجزي يومك معانا دلوقتي 👰🏻‍♀️
''', urlImage: ImageRoot.dressImageOne),
  InstagramView(
      urlImage: ImageRoot.dressImageSix,
      title: ''' اليوم بتفاصيلة ميكملش غير ب ديفا 👰🏻❤️
من أول مناقشتنا معاكي لاختيار اللوك المناسب 
ليكي لحد اللحظة اللي بتبصي فيها في مرايتك وتلاقي قمر منور 👌🏻🤍 
متنسيش تسألينا ع تفاصيل حجز الميك اب الفرح والحنة '''),
  InstagramView(
      urlImage: ImageRoot.dressImageOne, title: ''' هتفضلي دايما متألقة 😍
طول ما إختيارك الأول كان ديفا ❤️
ديفا ميكب مميز ولايق عليكي بفستان وحجاب يخلوكي منورة ✨ 
متنسيش تسألينا ع تفاصيل حجز الميك أب الفرح والحنة '''),
  InstagramView(urlImage: ImageRoot.dressImageThree, title: ''' مظبوط بالملي ✨
الميك أب مرسوم على الملامح والعيون جريئة بنظرات ساحرة ..
ده المتوقع دايما من ديفا 😉❤️ 
متنسيش تسألينا ع تفاصيل حجز الميك أب للحنة والدخلة ✨'''),
  InstagramView(
      urlImage: ImageRoot.dressImageFour,
      title: ''' عرايس ديڤا حكايات يتحكى فيها 💜
إحنا فى ديفا بنور ملامحك ونبرزها ونخليكى ملكة متوجه في يومك 👑
إحجزي يومك وسيبي الباقي علينا 🥀 
ومتنسيش تسألينا ع تفاصيل حجز الميك أب الفرح والحنة ✨'''),
  InstagramView(
      urlImage: ImageRoot.dressImageFive,
      title: ''' كله عادي إلا عرايس ديفا قمر ومنور🥰
ميك أب وفساتين ورقه وجمال ملوش مثال 💜💅
عرايسنا أحلى من القمر ♥️ 
متنسيش تسألينا ع تفاصيل حجز الميك اب والفرح والحنة ✨''')
];
