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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const LauncherPage(),
    );
  }
}

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF15151F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(width: 10),
              Text('Server Info'),
            ],
          ),
          content: const Text(
            'Welcome to Katioucha City Roleplay!\n\n'
            'Enjoy your experience and respect the server rules.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111118),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notifications'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.deepPurpleAccent,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  trailing: const Text(
                    'English',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        backgroundColor: const Color(0xFF1B1B27),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.black,
                );
              },
            ),
          ),

          // DARK GRADIENT
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.45),
                    Colors.black.withOpacity(0.70),
                    Colors.black.withOpacity(0.92),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
              child: Column(
                children: [
                  // HEADER
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                          ),
                        ),
                        child: const Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KATIOUCHA CITY',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'ROLEPLAY SERVER',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white54,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      _headerButton(
                        icon: Icons.info_outline,
                        onPressed: () => _showInfo(context),
                      ),

                      const SizedBox(width: 8),

                      _headerButton(
                        icon: Icons.settings_outlined,
                        onPressed: () => _showSettings(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // HERO CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(0xCC09090F),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(0.45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.12),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // LOGO
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF8E2DE2),
                                Color(0xFF4A00E0),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurpleAccent.withOpacity(0.45),
                                blurRadius: 30,
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

                        const SizedBox(height: 20),

                        const Text(
                          'KATIOUCHA CITY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.5,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'SA-MP ROLEPLAY',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.5,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // SERVER STATUS
                        Row(
                          children: [
                            Expanded(
                              child: _statusCard(
                                Icons.circle,
                                'ONLINE',
                                'Server',
                                Colors.greenAccent,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _statusCard(
                                Icons.people_alt_outlined,
                                '142 / 500',
                                'Players',
                                Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _statusCard(
                                Icons.flag_outlined,
                                'TUNISIA',
                                'Region',
                                Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // PLAY BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              _showMessage(
                                context,
                                'Launching Katioucha City...',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              foregroundColor: Colors.white,
                              elevation: 10,
                              shadowColor:
                                  Colors.deepPurpleAccent.withOpacity(0.45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  size: 28,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'PLAY NOW',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // UPDATE BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              _showMessage(
                                context,
                                'Checking for updates...',
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.18),
                              ),
                              backgroundColor:
                                  Colors.white.withOpacity(0.04),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.system_update_outlined),
                                SizedBox(width: 8),
                                Text(
                                  'CHECK FOR UPDATE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ONLINE INDICATOR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'SERVER ONLINE',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // NEWS HEADER
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'LATEST NEWS',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // NEWS CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xCC101018),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.07),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.newspaper_outlined,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to Katioucha City',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Join the community and enjoy the ultimate SA-MP roleplay experience.',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // QUICK ACTIONS
                  Row(
                    children: [
                      Expanded(
                        child: _quickAction(
                          Icons.discord,
                          'COMMUNI
