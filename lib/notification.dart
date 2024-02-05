import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/communication.dart';
import 'package:calendar_app/services/getNotification.dart';
import 'package:calendar_app/widgets/communicationItem.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  Future<List<CommunicationType>> notifications = getNotification();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ).drive(Tween(begin: const Offset(0.0, 0.4), end: Offset.zero));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.pastelBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: FutureBuilder<List<CommunicationType>>(
          future: notifications,
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
              final notificationData = snapshot.data!;
              return ListView.builder(
                itemCount: notificationData.length,
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
                child: Text('No notifications found.'),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
