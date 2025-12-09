import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AchievementNotification extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;
  final VoidCallback onDismiss;

  const AchievementNotification({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    // Auto dismiss after 4 seconds
    Future.delayed(const Duration(seconds: 4), onDismiss);

    return Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2E7D32),
                Color(0xFF66BB6A),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              // Emoji Badge
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(width: 15),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.emoji_events,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'PENCAPAIAN BARU!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Close Button
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onDismiss,
              ),
            ],
          ),
        )
            .animate()
            .slideY(begin: -1, end: 0, duration: 500.ms, curve: Curves.elasticOut)
            .fadeIn(duration: 300.ms)
            .shake(delay: 500.ms, duration: 500.ms),
      ),
    );
  }
}

/// Show achievement notification
void showAchievementNotification(
  BuildContext context, {
  required String emoji,
  required String title,
  required String description,
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => AchievementNotification(
      emoji: emoji,
      title: title,
      description: description,
      onDismiss: () {
        overlayEntry.remove();
      },
    ),
  );

  overlay.insert(overlayEntry);
}
