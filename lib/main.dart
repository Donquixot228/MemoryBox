import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/cubits/collections_builder_cubit/collections_builder_cubit.dart';
import 'package:memorybox2/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/routes/app_router.dart';
import 'package:memorybox2/services/locator.dart';
import 'blocs/recording_bloc/recording_bloc.dart';
import 'cubits/auth_cubit/signup_cubit.dart';
import 'repositories/auth_repository/auth_repository.dart';
import 'repositories/database_repository/database_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFF6F6F6),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => DataBaseRepository(),
          ),
          BlocProvider(
            create: (context) => RecordingBloc(
                dataBaseRepository: context.read<DataBaseRepository>()),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              dataBaseRepository: context.read<DataBaseRepository>(),
            ),
          ),
          BlocProvider(create: (context) => NavigationIndexCubit()),
          BlocProvider(create: (context) => AudioFileBuilder()),
          BlocProvider(create: (context) => CollectionsBuilderCubit()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Аудиосказки',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: _checkAuth());
  }

  Widget _checkAuth() {
    if (FirebaseAuth.instance.currentUser != null) {
      return const PermanentUserSplash();
    }
    return const WelcomePage();
  }
}
