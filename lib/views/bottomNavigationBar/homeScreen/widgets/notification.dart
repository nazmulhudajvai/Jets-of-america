import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.splashBackground,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        title: Text(
          "Notifications",
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NotificationTile(
            title: "New message from Support",
            message: "Your request has been received and is being reviewed.",
            time: "2 min ago",
            isUnread: true,
            icon: Icons.chat_bubble_outline,
          ),
          _NotificationTile(
            title: "Flight Booking Confirmed",
            message: "Your private jet booking has been confirmed.",
            time: "10 min ago",
            isUnread: true,
            icon: Icons.airplane_ticket_outlined,
          ),
          _NotificationTile(
            title: "Payment Successful",
            message: "Your payment of \$12,500 was processed successfully.",
            time: "45 min ago",
            isUnread: false,
            icon: Icons.credit_card_outlined,
          ),
          _NotificationTile(
            title: "Profile Updated",
            message: "Your profile information was updated successfully.",
            time: "1 hour ago",
            isUnread: false,
            icon: Icons.person_outline,
          ),
          _NotificationTile(
            title: "Security Alert",
            message: "New login detected from a new device.",
            time: "Yesterday",
            isUnread: true,
            icon: Icons.lock_outline,
          ),
          _NotificationTile(
            title: "Flight Reminder",
            message: "Your flight departs tomorrow at 9:30 AM.",
            time: "Yesterday",
            isUnread: false,
            icon: Icons.notifications_active_outlined,
          ),
          _NotificationTile(
            title: "Special Offer",
            message: "Enjoy 15% off on your next booking this week.",
            time: "2 days ago",
            isUnread: false,
            icon: Icons.local_offer_outlined,
          ),
          _NotificationTile(
            title: "Welcome!",
            message: "Thanks for joining Jets of America 🎉",
            time: "2 days ago",
            isUnread: false,
            icon: Icons.celebration_outlined,
          ),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isUnread;
  final IconData icon;

  const _NotificationTile({
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isUnread
            ? Colors.white.withOpacity(0.08)
            : Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isUnread
              ? Appcolors.whiteColor.withOpacity(0.25)
              : Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Appcolors.whiteColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Appcolors.whiteColor,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          /// TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Appcolors.whiteColor,
                    fontSize: 14,
                    fontWeight:
                    isUnread ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.montserrat(
                    color: Appcolors.whiteColor.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          /// TIME
          Text(
            time,
            style: GoogleFonts.montserrat(
              color: Appcolors.whiteColor.withOpacity(0.4),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
