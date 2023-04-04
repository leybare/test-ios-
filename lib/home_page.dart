import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InstagramClone extends StatefulWidget {
  @override
  _InstagramCloneState createState() => _InstagramCloneState();
}

class _InstagramCloneState extends State<InstagramClone> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/camera.svg'),
          onPressed: () {},
        ),
        title: SvgPicture.asset('assets/icons/instagram_logo.svg'),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/message.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/$index/200/300',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Container(
            child: Center(
              child: Text('Search'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Upload'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Activity'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Profile'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/upload.svg'),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/activity.svg'),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 13,
              backgroundImage:
              CachedNetworkImageProvider('http:picsum.photos/id/10/200/300'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }}
