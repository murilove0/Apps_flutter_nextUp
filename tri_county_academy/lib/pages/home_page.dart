import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool showBanner = false;
  String bannerImageUrl = '';
  String bannerLinkUrl = '';

  @override
  void initState() {
    super.initState();
    _requestNotificationPermissions();
    _initializeFirebaseMessaging();
    _initializeLocalNotifications();
    _loadBannerConfig();
  }

  Future<void> _loadBannerConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();

    setState(() {
      showBanner = remoteConfig.getBool('show_banner');
      bannerImageUrl = remoteConfig.getString('banner_image_url');
      bannerLinkUrl = remoteConfig.getString('banner_link_url');
    });
  }

  void _requestNotificationPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });
  }

  void _initializeLocalNotifications() {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    _localNotifications.initialize(settings);
  }

  void _showLocalNotification(RemoteMessage message) {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default',
      channelDescription: 'Notificações do app',
      importance: Importance.max,
      priority: Priority.high,
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    _localNotifications.show(
      0,
      message.notification?.title ?? 'Nova notificação',
      message.notification?.body ?? '',
      platformDetails,
    );
  }

  void _shareApp() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final link = Platform.isAndroid
        ? remoteConfig.getString('android_share_url')
        : remoteConfig.getString('ios_share_url');

    await Share.share('Check out this amazing app! Download now:\n$link');
  }

  void _launchBanner() async {
    final uri = Uri.parse(bannerLinkUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Back Ground
          Positioned.fill(
            child: Image.asset(
              'assets/HomeScreen.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Conteúdo principal
          SafeArea(
            minimum: EdgeInsets.zero, // evita margens extras do sistema
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120),

                // Botão Connect
                GestureDetector(
                  onTap: () async {
                    final Uri telUri = Uri(scheme: 'tel', path: '988');
                    if (await canLaunchUrl(telUri)) {
                      await launchUrl(
                        telUri,
                        mode: LaunchMode.externalApplication, // força abrir o app de telefone
                      );
                    } else {
                      print('Não foi possível abrir o discador.');
                    }
                  },
                  child: Image.asset(
                    'assets/connect.png',
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 40),

                // Linha com 3 botões responsivos e alinhados
                Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _ImageButton(
                          imagePath: 'assets/helpline.png',
                          onTap: () async {
                            final Uri telUri = Uri(scheme: 'tel', path: '988');
                            if (await canLaunchUrl(telUri)) {
                              await launchUrl(
                                telUri,
                                mode: LaunchMode.externalApplication, // força abrir o app de telefone
                              );
                            } else {
                              print('Não foi possível abrir o discador.');
                            }
                          },
                        ),
                        _ImageButton(
                          imagePath: 'assets/resources.png',
                          onTap: () => Navigator.pushNamed(context, '/resources'),
                        ),
                        _ImageButton(
                          imagePath: 'assets/share.png',
                          onTap: _shareApp,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Banner (se houver)
                if (showBanner && bannerImageUrl.isNotEmpty)
                  GestureDetector(
                    onTap: _launchBanner,
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(bannerImageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const _ImageButton({required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.25;

    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize * 1.5,
        fit: BoxFit.contain,
      ),
    );
  }
}
