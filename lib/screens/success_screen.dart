
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'welcome_screen.dart';

class SuccessScreen extends StatefulWidget {
  final String userName;

  const SuccessScreen({
    super.key,
    required this.userName,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.userName.trim();

    return Scaffold(
      backgroundColor: const Color(0xFF160D2B),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      size: 85,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 25),

                    const Text(
                      'Signup Successful!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      name.isEmpty
                          ? 'Welcome, Explorer!'
                          : 'Welcome, $name!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.amberAccent,
                      ),
                    ),
                    const SizedBox(height: 15),

                    const Text(
                      'Your magical journey begins here!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 40),

                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const WelcomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Back to Welcome'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          IgnorePointer(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality:
                    BlastDirectionality.explosive,
                shouldLoop: false,
                numberOfParticles: 30,
                emissionFrequency: 0.05,
                gravity: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
