// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mountain_travel/core/animations/fade_animation.dart';
import 'package:mountain_travel/core/common_color/common_color.dart';
import 'package:mountain_travel/features/checkout/widget/master_painter2.dart';

import 'package:mountain_travel/features/home/model/place_model.dart';
import 'package:mountain_travel/router/router.dart';
import 'package:slider_button/slider_button.dart';

// ignore: must_be_immutable
class CheckOutScreen extends StatefulWidget {
  PlaceModel model;
  CheckOutScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MasterPainter2(),
        child: Stack(
          children: [
            Positioned(
              bottom: 160,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1, end: 0.4),
                duration: const Duration(seconds: 2),
                builder: (BuildContext context, double value, Widget? child) {
                  return Opacity(
                    opacity: value,
                    child: Image.asset(
                      "assets/images/pngwing.com.png",
                      color: primarycolor,
                      fit: BoxFit.cover,
                      height: 900,
                      width: 450,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  backgroundColor: Colors.transparent,
                  displacement: 0,
                  strokeWidth: 0,
                  color: Colors.transparent,
                  onRefresh: () async {
                    context.pop();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Swipe to back ",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Iconsax.arrow_down_1,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeAnimation(
                              begin: 0.1,
                              end: 0.9,
                              duration: const Duration(seconds: 1),
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: Colors.white.withOpacity(0.4)),
                                    color: yellowcolor.withOpacity(0.6)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 160,
                                    width: 160,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.4)),
                                    child: Image.asset(
                                      widget.model.image_url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.model.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  child: Text(
                                    widget.model.trip,
                                    style: GoogleFonts.poppins(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.model.timing['date']
                                                ?.split(" ")[0] ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            color: yellowcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "  ${widget.model.timing['date']?.split(" ")[1]}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.transparent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Iconsax.global,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Tour",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.transparent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "\$${widget.model.price["tour_price"]}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    width: 180,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                      "Enim magna irure deserunt adipisicing ea cillum fugiat irure aute laboris. Do labore est reprehenderit minim. Ipsum reprehenderit velit labore esse Lorem proident exercitation ullamco cupidatat do.",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.transparent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.flight,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Flight",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: -0.00, end: -0.03),
                              duration: const Duration(seconds: 1),
                              builder: (BuildContext context, double value,
                                  Widget? child) {
                                return RotationTransition(
                                  turns: AlwaysStoppedAnimation<double>(value),
                                  child: Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.transparent.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 80,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Center(
                                            child: Text(
                                              "\$${widget.model.price["flight_price"]}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          width: 180,
                                          child: Center(
                                            child: Text(
                                              "OSL > > > BPN",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Trip",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Duration",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.black.withOpacity(0.4)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      widget.model.timing['days'] ?? '',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "days",
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.black.withOpacity(0.4)),
                              child: Center(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        widget.model.timing['hours'] ?? '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "hours",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.black.withOpacity(0.4)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      widget.model.timing['minute'] ?? '',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "minute",
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          // ignore: prefer_const_constructors
                          padding: EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 200, end: 400),
                              duration: const Duration(milliseconds: 500),
                              builder: (BuildContext context, double value,
                                  Widget? child) {
                                return SliderButton(
                                  disable: false,
                                  vibrationFlag: true,
                                  dismissThresholds: 0.75,
                                  action: () async {
                                    Fluttertoast.showToast(
                                        msg: "Tour has been added 😊",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: primarycolor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //         backgroundColor: secondrycolor,
                                    //         content: const Text(
                                    //             "Tour has been added 😊!")));
                                    context.push(
                                      Routes.homescreen.path,
                                    );
                                    return true;
                                  },
                                  alignLabel: Alignment.center,
                                  label: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.1, end: 0.8),
                                    duration: const Duration(seconds: 2),
                                    builder: (BuildContext context,
                                        double value, Widget? child) {
                                      return Opacity(
                                        opacity: value,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "                   \$${widget.model.price["tour_price"]! + widget.model.price["flight_price"]!}  checkout > > >",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      );
                                    },
                                  ),
                                  width: value,
                                  height: 90,
                                  buttonSize: 70,
                                  buttonColor: yellowcolor,
                                  shimmer: false,
                                  icon: const Icon(Iconsax.bag_2),
                                  backgroundColor:
                                      Colors.transparent.withOpacity(0.4),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
