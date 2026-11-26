import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

// The newsfeed: a list of two posts.
// TODO: Post 1 is YOUR post. Replace 'Your Name' with your own name
// and write your own post text.
// TODO: Post 2 is by a CLASSMATE you pick. Replace "Classmate's Name"
// with their name and write their post text.

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    required this.profileAsset,
    this.imageAsset,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  final String profileAsset;
  final String? imageAsset;
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'Thomaro Jhay Malaca',
      date: 'October 11',
      text: 'Lebron James is the GOAT!',
      likes: 100,
      profileAsset: 'assets/images/dp.png',
      imageAsset: null,
    ),
    Post(
      authorName: "Arjay Postor",
      date: 'December 2',
      text: 'Walang kanin buseng!',
      likes: 200,
      profileAsset: 'assets/images/kerwin.png',
      // TODO: Add an image file named post_image.png to assets/images/,
      // or change this path to your own image. If the file is missing,
      // the card shows a grey placeholder instead of crashing.
      imageAsset: 'assets/images/images.jpg',
    ),
  ];

  void _likePost(int index) {
    setState(() {
      _posts[index].likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          profileAsset: post.profileAsset,
          imageAsset: post.imageAsset,
          onLike: () => _likePost(index),
        );
      },
    );
  }
}
