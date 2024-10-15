import 'package:flutter/material.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_event.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReelsPage extends StatefulWidget {
  final int initialVideoIndex;

 const ReelsPage({super.key,required this.initialVideoIndex});

  @override
  ReelsPageState createState() => ReelsPageState();
}

class ReelsPageState extends State<ReelsPage> {
  PageController _pageController = PageController();
  VideoPlayerController? _currentVideoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialVideoIndex);

    _currentIndex = widget.initialVideoIndex;

    _pageController.addListener(_scrollListener);

    _loadAndPlayVideo(_currentIndex);
  }

  @override
  void dispose() {
    _currentVideoController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _loadAndPlayVideo(int index) {
    final reelsData = context.read<ReelsBloc>().reelsData;

    if (index >= reelsData.length) return;

    final videoUrl = reelsData[index].videoUrl;

    _currentVideoController?.dispose();

    _currentVideoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {
          _currentVideoController?.play();
        });
      });
  }

  void _scrollListener() {
    final currentPage = _pageController.page?.round();
    if (currentPage != null && currentPage != _currentIndex) {
      setState(() {
        _currentIndex = currentPage;
      });

      _loadAndPlayVideo(_currentIndex);
    }

    if (_pageController.position.pixels >=
        _pageController.position.maxScrollExtent * 0.8) {
      context.read<ReelsBloc>().add(FetchReels());
    }
  }

  @override
  Widget build(BuildContext context) {
   var videosData = context.read<ReelsBloc>().reelsData;
    
        if (videosData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: videosData.length,
            itemBuilder: (context, index) {
              if (index == _currentIndex && _currentVideoController != null && _currentVideoController!.value.isInitialized) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_currentVideoController!.value.isPlaying) {
                        _currentVideoController!.pause();
                      } else {
                        _currentVideoController!.play();
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _currentVideoController!.value.aspectRatio,
                        child: VideoPlayer(_currentVideoController!),
                      ),
                      if (!_currentVideoController!.value.isPlaying)
                       const Icon(Icons.play_arrow, color: Colors.white, size: 50),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      
    
  }
}
