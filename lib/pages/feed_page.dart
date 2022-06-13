import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui/model/story_model.dart';

import '../model/post_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static const String id = 'feed_page';

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Roma'),
    Story('assets/images/user_3.jpeg', 'Suzana'),
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Roma'),
    Story('assets/images/user_3.jpeg', 'Suzana'),
  ];
  final List<Post> _posts = [
    Post(
        userImage: 'assets/images/user_1.jpeg',
        userName: 'Brianne',
        postImage: 'assets/images/feed_1.jpeg',
        caption: 'DEVELOPER 009 DEVELOPER 009 DEVELOPER 009'),
    Post(
        userImage: 'assets/images/user_2.jpeg',
        userName: 'Henri',
        postImage: 'assets/images/feed_2.jpeg',
        caption: 'DEVELOPER 009 DEVELOPER 009 DEVELOPER 009'),
    Post(
        userImage: 'assets/images/user_3.jpeg',
        userName: 'Mariano',
        postImage: 'assets/images/feed_3.jpeg',
        caption: 'DEVELOPER 009 DEVELOPER 009 DEVELOPER 009'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //#stories
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'stories',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        'watch all',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                //#story list
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _stories.map((story) {
                      return _itemOfStory(story);
                    }).toList(),
                  ),
                ),
                //#post
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i) {
                      return _itemOfPost(_posts[i]);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.deepPurple,
              width: 3,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          story.name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Column(
      children: [
        //#header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    post.userName,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  SimpleLineIcons.options,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        //#post image
        FadeInImage(
            placeholder: const AssetImage('assets/images/placeholder.png'),
            image: AssetImage(post.postImage)),
        //#comment
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(FontAwesome.heart_o,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: const Icon(FontAwesome.comment_o,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: const Icon(FontAwesome.send_o,color: Colors.white,)),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(FontAwesome.bookmark_o,color: Colors.white,))
          ],
        ),
        //#tags
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          width: MediaQuery.of(context).size.width,
          child: RichText(
            overflow: TextOverflow.visible,
            softWrap: true,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: '  Stiv',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: '  Roger',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: '  Rezerford',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: '  and',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: '  1245 other people',
                  style: TextStyle(color: Colors.white),
                ),
              ]
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: RichText(
            overflow: TextOverflow.visible,
            softWrap: true,
            text: TextSpan(
                children: [
                   TextSpan(
                    text:post.userName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: post.caption,
                    style: const TextStyle(color: Colors.grey),
                  ),


                ]
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical:5),
          alignment: Alignment.topLeft,
          child: Text('February 2022',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),
        )
      ],
    );
  }
}
