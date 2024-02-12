
import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpg", "Gulchapchap"),
    Story("assets/images/user_2.jpg", "G`anisher"),
    Story("assets/images/user_3.jpg", "Lobar"),
    Story("assets/images/user_1.jpg", "Gulchapchap"),
    Story("assets/images/user_2.jpg", "G`anisher"),
    Story("assets/images/user_3.jpg", "Lobar"),
  ];

  List<Post> _post = [
    Post(
        userName: "Malika",
        userImage: "assets/images/user_1.jpg",
        postImage: "assets/images/feed_1.jpg",
        caption: "Bo`bik bilan birag o`ynavommiza"),
    Post(
        userName: "Halimjon",
        userImage: "assets/images/user_2.jpg",
        postImage: "assets/images/feed_2.jpg",
        caption: "Bo`bik bilan birag o`ynavommiza"),
    Post(
        userName: "Marina",
        userImage: "assets/images/user_3.jpg",
        postImage: "assets/images/feed_3.jp g",
        caption: "Bo`bik bilan birag o`ynavommiza"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),

              //#stories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stories",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Watch All",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
              ),

              // #storylist
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _stories.map((story){
                    return itemOfStory(story);
                  }).toList(),
                ),
              ),

              //#postlist
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:_post.length ,
                  itemBuilder: (ctx,i){
                    return itemOfPost(_post[i]);
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget itemOfPost(Post post){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(image: AssetImage(post.userImage!),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10,),
                Text(post.userName!),
                Expanded(
                  child: SizedBox.shrink(),
                ),
                IconButton(onPressed: (){},
                icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),

          FadeInImage(
            image: AssetImage(post.postImage!),
            placeholder: AssetImage("assets/images/placeholder.png"),
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.message_outlined),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.send_sharp),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.bookmark_border),
              )
            ],
          ),

          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text:TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Salim, Yormat, Donyor',
                    style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "and",
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: "1000 others",
                    style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold)
                  )
                ]
              )

            ),
          ),

          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text:TextSpan(
                children: [
                  TextSpan(
                    text: post.userName!,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "${post.caption}",
                    style: TextStyle(color: Colors.black)
                  )
                ]
              )
            ),
          )
        ],
      ),
    );
  }

  Widget itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width:3,color: Color(0xFF8e44ad)),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image!),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(story.userName!)
      ],
    );
  }

}
