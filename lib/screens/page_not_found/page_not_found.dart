import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';

import '../../styleguide/colors.dart';
import '../../styleguide/text_styles.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 256,
            // padding: EdgeInsets.symmetric(horizontal: 5),
            color: const Color(0xffF8F9FE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.only(right: 110),
                      child: Image.asset(
                        kyshiLogo,
                        width: 106,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "© 2022 Kyshi Limited. All rights reserved.",
                    style: TextStyle(
                        color: Color(0XFF233375),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'PushPenny'),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            child: Row(
              children: [
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 250),
                        child: SvgPicture.asset(error),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Ooops...",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 64,
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Page Not Found",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 64,
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Sorry. the content you’re looking for doesn’t exist.\nEither it was removed, or you mistyped the link. ",
                                style: TextStyle(
                                    color: kyshiGreyishBlue,
                                    fontSize: 18,
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(height: 30),
                              KyshiButtonResponsive(
                                color: primaryColor,
                                onPressed: () {},
                                size: 200,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(outArrow),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Go Back Home",
                                      style: buttonTextStyleResponsive,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Center(
                              child: SvgPicture.asset(
                            errorCode,
                            width: 150,
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //...
        ],
      ),
    );
  }

  Column buildColumn(
      {required String title, required String image, required bool svg}) {
    return Column(
      children: [
        svg ? SvgPicture.asset(image) : Image.asset(image),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0XFF353D46)),
        ),
      ],
    );
  }
}
