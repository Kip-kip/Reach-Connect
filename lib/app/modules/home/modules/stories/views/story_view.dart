import 'package:bridgme/app/modules/home/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../models/stories/story_model.dart';
import '../../../../../shared/components/utility/animated_bar.dart';
import '../../../../../shared/utils/utils.dart';
import '../controllers/story_logic.dart';

class StoryScreen extends StatefulWidget {
  DashboardController controller = Get.put(DashboardController());


  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  final _pageCont = PageController();
  final _storiesController = Get.put(StoryLogic());

  StoryModel currentStory = StoryModel(
    url: "",
    media: MediaType.image,
    duration: Duration(seconds: 3),
    owner: 'philmaxsnr@gmail.com',
    user: 'Philip',
    expiry: DateTime.now().millisecondsSinceEpoch,
    // user: UserModelEntity()
  );
  late AnimationController animaController;
  int currentIndex = 0;
  late VideoPlayerController _vidCont;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    currentStory = _storiesController.stories[currentIndex];
    animaController = AnimationController(vsync: this);
    onLoadStory(story: currentStory, toNextPage: false);

    animaController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animaController.stop();
        animaController.reset();
        setState(() {
          if (currentIndex < (_storiesController.stories.length - 1)) {
            currentIndex++;
            onLoadStory(story: _storiesController.stories[currentIndex]);
          } else {
            //Get.back();
          }
        });
      }
    });
  }

  void onLoadStory({required StoryModel story, bool toNextPage = true}) {
    animaController.stop();
    animaController.reset();
    switch (story.media) {
      case MediaType.image:
        animaController.duration = story.duration;
        animaController.forward();
        break;
      case MediaType.video:
        // _vidCont = null;
        // _vidCont?.dispose();
        _vidCont = VideoPlayerController.network(
          story.url,
        );

        _initializeVideoPlayerFuture = _vidCont.initialize();
        _initializeVideoPlayerFuture.then((_) {
          setState(() {
            animaController.duration = _vidCont.value.duration;
            _vidCont.play();
            animaController.forward();
          });
        });
        break;
    }

    if (toNextPage) {
      _pageCont.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageCont.dispose();
    // _vidCont?.dispose();
    animaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: GestureDetector(
          onTapDown: (detail) => onTapStory(detail, currentStory),
          onTapUp: (detail) => onTapUpStory(detail, currentStory),
          child: Stack(
            children: [
              NotificationListener(
                  onNotification: (notif) {
                    if (notif is ScrollUpdateNotification) {
                      final _index =
                          int.parse(_pageCont.page!.toStringAsFixed(0));
                      setState(() {
                        currentIndex = _index;
                        currentStory = _storiesController.stories[_index];
                      });
                    }
                    return true;
                  },
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageCont,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.controller.selectedUserStory.first.stories.length,
                      itemBuilder: (context, index) {
                        final StoryModel story =
                            widget.controller.selectedUserStory.first.stories[index];
                        switch (story.media) {
                          case MediaType.image:
                            return CachedNetworkImage(
                              imageUrl: story.url,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              fit: BoxFit.cover,
                            );
                          case MediaType.video:
                            return FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  _vidCont.play();
                                  return FittedBox(
                                    fit: BoxFit.cover,
                                    child: SizedBox(
                                      width: _vidCont.value.size.width,
                                      height: _vidCont.value.size.height,
                                      child: VideoPlayer(_vidCont),
                                    ),
                                  );
                                } else {
                                  animaController.stop();
                                  // If the VideoPlayerController is still initializing, show a
                                  // loading spinner.
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            );
                        }

                        return const SizedBox.shrink();
                      })),
              Positioned(
                left: 10,
                right: 10,
                top: MediaQuery.of(context).padding.top + 10,
                child: Column(
                  children: [
                    Row(
                      children: List.generate(_storiesController.stories.length,
                          (index) {
                        return AnimatedBar(
                          animaController: animaController,
                          position: index,
                          currentIndex: currentIndex,
                        );
                      }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                                radius: 50, backgroundImage: NetworkImage(SessionUtils.getAvatarLink(widget.controller.selectedUserStory.first.owner))),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text(widget.controller.selectedUserStory.first.user,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white))),
                          IconButton(
                            icon: Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                              goBack();
                            },
                          ),
                        ])),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void onTapUpStory(TapUpDetails detail, StoryModel story) {
    if (story.media == MediaType.video) {
      if (!_vidCont.value.isPlaying) {
        _vidCont.play();
        animaController.forward();
      }
    } else {
      animaController.forward();
    }
  }

  void onTapStory(TapDownDetails detail, StoryModel story) {
    final sizeScreen = MediaQuery.of(context).size;
    final leftScreen = sizeScreen.width * 0.3;
    final rightScreen = sizeScreen.width * 0.6;
    final currentPosition = detail.globalPosition.dx;

    if (currentPosition <= leftScreen && currentIndex != 0) {
      setState(() {
        currentIndex--;
        onLoadStory(story: _storiesController.stories[currentIndex]);
      });
    } else if (currentPosition >= rightScreen &&
        currentIndex != (_storiesController.stories.length - 1)) {
      setState(() {
        currentIndex++;
        onLoadStory(story: _storiesController.stories[currentIndex]);
      });
    } else if ((currentPosition <= leftScreen && currentIndex == 0) ||
        (currentPosition >= rightScreen &&
            currentIndex == (_storiesController.stories.length - 1))) {
//  		Get.back();
    } else {
      if (story.media == MediaType.video) {
        if (_vidCont.value.isPlaying) {
          _vidCont.pause();
          animaController.stop();
        }
      } else {
        animaController.stop();
      }
    }
  }
}
