// ignore_for_file: camel_case_types, library_private_types_in_public_api, unnecessary_null_comparison
import 'package:career_paths/screens/pages/suggestions_video/models/channel.model.dart';
import 'package:career_paths/screens/pages/suggestions_video/models/video_model.dart';
import 'package:career_paths/screens/pages/suggestions_video/services/api_services.dart';
import 'package:career_paths/screens/pages/suggestions_video/video_screen/video_screen.dart';
import 'package:career_paths/shimmer%20effect/skeleton%20screens/skeletondata.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  late Channel _channel;
  bool _isLoading = false;
  bool isFetch = true;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCpLKqC4BVf57nLX6ew7Omxw');
    setState(() {
      _channel = channel;
      isFetch = false;
    });
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          PageTransition(
              child: VideoScreen(id: video.id),
              type: PageTransitionType.bottomToTop)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 199, 190, 190)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                width: 150.0,
                placeholder: const AssetImage('assets/images/no_institute.png'),
                image: NetworkImage(video.thumbnailUrl),
                imageErrorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/no_institute.png',
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                maxLines: 5,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overSCroll) {
        overSCroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        body: isFetch
            ? ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
              )
            : _channel != null
                ? NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollDetails) {
                      if (!_isLoading &&
                          _channel.videos.length !=
                              int.parse(_channel.videoCount) &&
                          scrollDetails.metrics.pixels ==
                              scrollDetails.metrics.maxScrollExtent) {
                        _loadMoreVideos();
                      }
                      return false;
                    },
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: _channel.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Video video = _channel.videos[index];
                          return _buildVideo(video);
                        },
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor, // Red
                      ),
                    ),
                  ),
      ),
    );
  }
}
