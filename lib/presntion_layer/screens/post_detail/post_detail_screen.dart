import 'dart:convert';

import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:diva_final_project/cubit/facebook_posts/facebook_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';

import '../../../models/fb_data.dart';
import 'facebook_posts.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String fbUrl =
      'https://graph.facebook.com/v15.0/me?fields=id%2Cname%2Cposts%7Bfull_picture%2Cmessage%7D&access_token=EAAMuZBf9MrtsBAOLGkZAiORfyFv8RXRZCcWUWeDrktPZCwj4RV88EDTJJ8yqCNtxQ5igb2zXEZAYOFw7MsMe45WUmgjkmZAxkmGuXwodUPVFbyXQDTPBhmBjEcwWqahCOlSh8ZB3eiFQH69ubC8ZAP9VSVPpNSaqyHUjpu8dZC5bc0CUvPhHsu2OH';
  List<Data> fbDataList = [];
  Client client = Client();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    try {
      final response = await client.get(Uri.parse(fbUrl));
      if (response.statusCode == 200) {
        Iterable i = json.decode(response.body)['posts']['data'];
        setState(() {
          fbDataList = i.map((data) => Data.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePagCubit, HomePagStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePagCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            title: SvgPicture.asset(
              'assets/svg/facebook-5-logo-svgrepo-com.svg',
              color: Colors.blue,
              height: 150,
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                  itemCount: fbDataList.length,
                  itemBuilder: (context, index) => FaceBookPosts(
                        fbData: fbDataList[index],
                      )
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         CircleAvatar(
                  //             backgroundColor: Colors.transparent,
                  //             radius: 25.r,
                  //             backgroundImage: AssetImage(ImageRoot.divaLogo)),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Text('divanice'),
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'عروسه ديفا المميزه كل الكلام ده وأكتر كمان هتسمعيه يوم فرحك بعد ما تختاري فستانك والميك اب مع ديفا ',
                  //           maxLines: 2,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //         SizedBox(
                  //           height: 15.h,
                  //         ),
                  //         Container(
                  //             height: 200.h,
                  //             width: double.infinity,
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.r),
                  //               child: Image(
                  //                 image: NetworkImage(
                  //                   'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/321177608_710504864005101_4234108739131537779_n.jpg?stp=cp6_dst-jpg_s600x600&_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFSUsr0Ho0_MGHSSpiTsnCSWBtqSEXNMr9YG2pIRc0yv7yIVBqRaGXy1BHh42px2EJxsJ87b31EoLyd4wCxLZoq&_nc_ohc=mxLuE49-bQQAX-PNJPh&_nc_ht=scontent.fcai19-1.fna&oh=00_AfCZQ6oZklZ1e3naDwr7HrY-MDXW8EPU9LudaDm49yJh0Q&oe=63A9AC40',
                  //                 ),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ))
                  //       ],
                  //     )
                  //   ],
                  // ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
