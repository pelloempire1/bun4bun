import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/screen/discover/view/addpostscren.dart';
import 'package:social_mobile_app/model/bun_post.dart';
import 'package:social_mobile_app/services/bun_service.dart';
import '../../../constant/color.dart';
import '../../../constant/widget/text_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final BunService _bunService = const BunService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mint,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: mint,
        backgroundColor: mint,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(()=>const AddPostScreen());
            },
            icon: Image.asset(
              add,
              height: 50,
              width: 50,
            ),
          ),
        ],
        title: kronaText("Discover", black, 18),
      ),
      body: StreamBuilder<List<BunPost>>(
        stream: _bunService.bunFeedStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: robotoText('Error: ${snapshot.error}', black, 14),
            );
          }

          final posts = snapshot.data ?? [];

          if (posts.isEmpty) {
            return Center(
              child: robotoText(
                "No posts yet.\nBe the first to spill some tea!",
                black,
                14,
              ),
            );
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return _buildPostCard(post);
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${date.day} ${months[date.month - 1]}, ${date.year}';
  }

  Widget _reactionButton(String label, int count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: mint,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: black),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            robotoText(label, black, 12),
            const SizedBox(width: 6),
            robotoText(count.toString(), black, 12),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(BunPost post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 0,
            spreadRadius: 0,
            color: black,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header – anonymous for now
          Row(
            children: [
              // placeholder avatar
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: mint,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: black),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kronaText("Anonymous", black, 14),
                  robotoText(_formatDate(post.createdAt), black, 12),
                ],
              ),
            ],
          ),

          // IMAGE (if any)
          if (post.imageUrl != null && post.imageUrl!.isNotEmpty) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                post.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ],

          const SizedBox(height: 10),

          // TEXT
          robotoText(post.text, black, 14),
          const SizedBox(height: 12),

          // REACTIONS
          Row(
            children: [
              _reactionButton(
                "Tea",
                post.hotTea,
                () => _bunService.reactToPost(post.id, 'reactions.hotTea'),
              ),
              const SizedBox(width: 8),
              _reactionButton(
                "Red Flag",
                post.redFlag,
                () => _bunService.reactToPost(post.id, 'reactions.redFlag'),
              ),
              const SizedBox(width: 8),
              _reactionButton(
                "Bun",
                post.bun,
                () => _bunService.reactToPost(post.id, 'reactions.bun'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget discover1() {
    return Container(
      margin:const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16),
      height: 415,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        boxShadow: const [
          BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        color: grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                d1,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kronaText("Olivia Brooks, 22", black, 14),
                  robotoText("8 Nov, 2024", black, 12)
                ],
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black),
                ], borderRadius: BorderRadius.circular(20), color: pink),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      coin1,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    robotoText("VIP", black, 12)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black),
              ],
              border: Border.all(color: black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              d2,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(heart),
              const SizedBox(
                width: 05,
              ),
              robotoText("26", black, 14),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    commentSheet();
                  },
                  child: SvgPicture.asset(comment)),
              const SizedBox(
                width: 05,
              ),
              robotoText("05", black, 14),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // bottomcontroller.bottomindex.value = 2;
                },
                child: Container(
                    height: 30,
                    width: 75,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: mint,
                      border: Border.all(color: black),
                    ),
                    child: Center(child: robotoboldText("Follow", black, 14))),
              ),
            ],
          ),
          robotoText(
              "Embracing every moment, creating memories, and connecting with amazing people along the way.",
              black,
              14,
              maxline: 2,
              textoverflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  commentSheet() {
    Get.bottomSheet(Container(
      height: 450,
      width: Get.width,
      decoration: const BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          kronaText("Comment", black, 14),
          commentWidget(
              comment:
                  "This is such a beautiful moment! You have an amazing way of capturing the vibe – can’t wait to see what you share next!⭐🤩",
              img: c1,
              isliked: false,
              likecount: "17",
              name: "Robert Turner",
              time: "30 min ago"),
          commentWidget(
              comment:
                  "This looks amazing! Can't wait to see more from you!❤💕 The colors and mood are mesmerizing.⭐🤩",
              img: c2,
              isliked: true,
              likecount: "10",
              name: "Emma Wilson",
              time: "20 min ago"),
          const SizedBox(
            height: 10,
          ),
          commentWidget(
              comment: "Incredible! Thanks for sharing this with us!.😍🥰",
              img: c3,
              isliked: true,
              likecount: "10",
              name: "Amelia Brooks",
              time: "20 min ago"),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 2,
            width: Get.width,
            color: black,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: Get.width * .80,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black),
                ], borderRadius: BorderRadius.circular(30), color: mint),
                child: Row(
                  children: [
                    SvgPicture.asset(smile),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: Get.width * .50,
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write comment...",
                              hintStyle: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 12,
                              )),
                        )),
                    const Spacer(),
                    SvgPicture.asset(camera),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black),
                ], shape: BoxShape.circle, color: pink),
                child: Center(child: SvgPicture.asset(share)),
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget commentWidget({img, name, time, likecount, isliked, comment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: black),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black),
                    ]),
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kronaText(name, black, 12),
                    robotoText(time, black.withValues(alpha:0.50), 12)
                  ],
                ),
              ),
              const Spacer(),
              robotoText(likecount, black, 12),
              const SizedBox(
                width: 05,
              ),
              isliked
                  ? SvgPicture.asset(heartfill)
                  : SvgPicture.asset(greyheart)
            ],
          ),
          robotoText(comment, black, 14, maxline: 3),
        ],
      ),
    );
  }

  Widget discover2() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      height: 400,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        boxShadow: const [
          BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        color: grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                d8,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kronaText("Grace Hamilton, 23", black, 14),
                  robotoText("8 Nov, 2024", black, 12)
                ],
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black),
                ], borderRadius: BorderRadius.circular(20), color: pink),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      coin1,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    robotoText("VIP", black, 12)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 250,
                    width: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SvgPicture.asset(play)
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width:Get.width<415 ?Get.width * .26: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width:Get.width<415 ?Get.width * .26: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d5,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d6,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d7,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(heart),
              const SizedBox(
                width: 05,
              ),
              robotoText("15", black, 14),
              const SizedBox(
                width: 15,
              ),
              GestureDetector( onTap: () {
                    commentSheet();
                  },child: SvgPicture.asset(comment)),
              const SizedBox(
                width: 05,
              ),
              robotoText("00", black, 14),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // bottomcontroller.bottomindex.value = 2;
                },
                child: Container(
                    height: 30,
                    width: 75,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: mint,
                      border: Border.all(color: black),
                    ),
                    child: Center(child: robotoboldText("Follow", black, 14))),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          robotoText("Hello....!", black, 14,
              maxline: 2, textoverflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }

  Widget discover3() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      height: 380,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        boxShadow: const [
          BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        color: grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                d9,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kronaText("James Harrison, 25", black, 14),
                  robotoText("8 Nov, 2024", black, 12)
                ],
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black),
                ], borderRadius: BorderRadius.circular(20), color: pink),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      coin1,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    robotoText("VIP", black, 12)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width: Get.width * .56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d10,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width: Get.width * .56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      d11,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                height: 250,
                width: Get.width * .28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: black),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black),
                  ],
                ),
                child: Image.asset(
                  d12,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(heart),
              const SizedBox(
                width: 05,
              ),
              robotoText("15", black, 14),
              const SizedBox(
                width: 15,
              ),
              GestureDetector( onTap: () {
                    commentSheet();
                  },child: SvgPicture.asset(comment)),
              const SizedBox(
                width: 05,
              ),
              robotoText("00", black, 14),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // bottomcontroller.bottomindex.value = 2;
                },
                child: Container(
                  height: 30,
                  width: 75,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: mint,
                    border: Border.all(color: black),
                  ),
                  child: Center(
                    child: robotoboldText("Follow", black, 14),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
