import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';
import 'package:privshare/modules/timeline/controllers/timeline_controller.dart';

class TimelinePage extends StatelessWidget {
  TimelinePage({
    Key? key,
    required this.authController,
    required this.timelineController,
  }) : super(key: key);

  final AuthController authController;
  final TimelineController timelineController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
        leading: IconButton(
          icon: Icon(
            (authController.user?.isSubscriber ?? false)
                ? Icons.check_box
                : Icons.check_box_outline_blank,
          ),
          onPressed: () => authController.subscribeToggle(),
        ),
        actions: [
          IconButton(
            onPressed: () => authController.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem vindo, ${authController.user?.username ?? ''}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Expanded(
                child: ListView(
                  children: timelineController.posts
                      .map(
                        (item) => Card(
                          color: (item.isSubscribersOnly)
                              ? Colors.amber
                              : Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: (item.isSubscribersOnly)
                                  ? authController.user?.isSubscriber ?? false
                                      ? Column(
                                          children: [
                                            Image.asset('assets/premium.jpg'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              item.text,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          'Conteúdo exclusivo para assinantes!')
                                  : Text(item.text),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
