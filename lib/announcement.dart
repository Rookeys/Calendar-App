import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/announcement.dart';
import 'package:calendar_app/services/getAnnouncement.dart';
import 'package:calendar_app/widgets/announcementItem.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement>
    with SingleTickerProviderStateMixin {
  Future<List<AnnouncementItem>> announcements = getAnnouncement();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward();

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final Animation<Offset> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ).drive(Tween(begin: const Offset(0.0, 0.4), end: Offset.zero));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.pastelBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: FutureBuilder<List<AnnouncementItem>>(
          future: announcements,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final announcements = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _animation,
                        child: AnnouncementListItem(
                          announcement: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('No announcements found.'),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
