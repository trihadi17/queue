import 'package:flutter/material.dart';

// Model
import 'package:queue/models/queue.dart';

// Theme
import 'package:queue/theme.dart';

class ListQueueWidget extends StatelessWidget {
  final QueueModel queue;

  ListQueueWidget(this.queue);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 5,
        left: 40,
        right: 40,
        bottom: 5,
      ),
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${queue.customerName}',
            style: greenTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'No Antrian : ${queue.queueNumber}',
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
