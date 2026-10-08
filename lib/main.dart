
import 'package:flutter/material.dart';

void main() {
  runApp(const KatiouchaApp());
}

class KatiouchaApp extends StatelessWidget {
  const KatiouchaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katioucha City',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LauncherPage(),
    );
  }
}

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'katioucha_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // DARK OVERLAY
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'KATIOUCHA CITY',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          _showInfo(context);
                        },
                        icon: const Icon(Icons.info_outline),
                      ),

                      IconButton(
                        onPressed: () {
                          _showSettings(context);
                        },
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // MAIN CONTENT
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.60),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.deepPurpleAccent.withOpacity(0.6),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      // LOGO
                      Container(
                        width: 105,
                        height: 105,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.75),
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurpleAccent.withOpacity(0.5),
                              blurRadius: 25,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.location_city,
                          size: 55,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'KATIOUCHA CITY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'SA-MP ROLEPLAY',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // SERVER INFO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _serverInfo(
                            Icons.circle,
                            'ONLINE',
                            Colors.greenAccent,
                          ),
                          _serverInfo(
                            Icons.people,
                            '142 / 500',
                            Colors.white,
                          ),
                          _serverInfo(
                            Icons.flag,
                            'TUNISIA',
                            Colors.white,
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // UPDATE BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showMessage(
                              context,
                              'Checking for updates...',
                            );
                          },
                          icon: const Icon(Icons.system_update),
                          label: const Text(
                            'CHECK FOR UPDATE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // PLAY BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _showMessage(
                              context,
                              'Launching Katioucha City...',
                            );
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text(
                            'PLAY',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            foregroundColor: Colors.white,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 9,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'SERVER ONLINE',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // NEWS
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.newspaper,
                        color: Colors.deepPurpleAccent,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Latest News\nWelcome to Katioucha City Roleplay!',
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  '© 2026 KATIOUCHA CITY',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _serverInfo(
    IconData icon,
    String text,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          size: 17,
          color: color,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style:
