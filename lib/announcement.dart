import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/communication.dart';
import 'package:calendar_app/services/getAnnouncement.dart';
import 'package:calendar_app/widgets/announcementBottomSheet.dart';
import 'package:calendar_app/widgets/communicationItem.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement>
    with SingleTickerProviderStateMixin {
  Future<List<CommunicationType>> announcements = getAnnouncement();

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
        child: FutureBuilder<List<CommunicationType>>(
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
              final listitem = snapshot.data!;
              return ListView.builder(
                itemCount: listitem.length,
                itemBuilder: (context, index) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _animation,
                      child: CommunicationItem(
                        listitem: snapshot.data![index],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No announcements found.'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.skyBlue,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const AnnouncementBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
