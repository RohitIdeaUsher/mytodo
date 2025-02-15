import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xFF151721)));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => {
      runApp(const Soltopiah()),
    },
  );
  // runApp(const Soltopiah());
}

class Soltopiah extends StatelessWidget {
  const Soltopiah({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return GestureDetector(
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                useInheritedMediaQuery: true,
                builder: (context, widget) {
                  return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: widget!);
                },
                title: "MyToDo",
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                theme: ThemeData.dark()),
          );
        });
  }
}

Future<void> initServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
