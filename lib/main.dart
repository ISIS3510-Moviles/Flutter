import 'package:campus_bites/data/offline/dietary_tag.dart';
import 'package:campus_bites/data/offline/food_tag.dart';
import 'package:campus_bites/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:campus_bites/config/router/app_router.dart';
import 'package:campus_bites/config/theme/util.dart';
import 'package:campus_bites/config/theme/theme.dart';
import 'package:campus_bites/data/offline/queued_comment.dart';
import 'package:campus_bites/data/offline/comment_queue_manager.dart';
import 'package:campus_bites/data/offline/queued_reservation.dart';
import 'package:campus_bites/data/offline/reservation_queue_manager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  await Hive.initFlutter();
  
  Hive.registerAdapter(QueuedCommentAdapter());
  await Hive.openBox<QueuedComment>('queued_comments');

  Hive.registerAdapter(QueuedReservationAdapter());
  await Hive.openBox<QueuedReservation>('queued_reservations');

  Hive.registerAdapter(FoodTagAdapter());
  await Hive.openBox<FoodTag>('food_tags');
  await Hive.openBox('meta');

  Hive.registerAdapter(DietaryTagAdapter());
  await Hive.openBox<DietaryTag>('dietary_tags');

  CommentQueueManager().startListener(
    onCommentSent: (message) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(message)),
      );
    },
  );
  ReservationQueueManager().startListener(
    onReservationSent: (message) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(message)),
      );
    },
  );

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Lexend", "Lexend");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      routerConfig: appRouter,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
    );
  }
}