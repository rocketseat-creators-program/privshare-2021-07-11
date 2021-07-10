import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';

class TimelineItem {
  final String text;
  final bool isSubscribersOnly;

  TimelineItem({
    required this.text,
    required this.isSubscribersOnly,
  });
}

class TimelinePage extends StatelessWidget {
  TimelinePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;
  final List<TimelineItem> items = [
    TimelineItem(
      text: 'Mensagem...',
      isSubscribersOnly: false,
    ),
    TimelineItem(
      text: 'Mensagem 2...',
      isSubscribersOnly: false,
    ),
    TimelineItem(
      text: 'Mensagem para assinantes...',
      isSubscribersOnly: true,
    ),
    TimelineItem(
      text: 'Mensagem 3...',
      isSubscribersOnly: false,
    ),
    TimelineItem(
      text: 'Mensagem 4...',
      isSubscribersOnly: false,
    ),
    TimelineItem(
      text: 'Mensagem para assinantes 2...',
      isSubscribersOnly: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
        leading: IconButton(
          icon: Obx(
            () => Icon(
              (controller.user.value?.isSubscriber ?? false)
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
            ),
          ),
          onPressed: () => controller.subscribeToggle(),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bem vindo, ${controller.user.value?.username ?? ''}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: items
                      .map(
                        (item) => Card(
                          color: (item.isSubscribersOnly)
                              ? Colors.amber
                              : Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: (item.isSubscribersOnly)
                                  ? controller.user.value?.isSubscriber ?? false
                                      ? Text(
                                          item.text,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
