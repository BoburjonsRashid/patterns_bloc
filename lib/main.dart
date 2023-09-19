import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/list_post_cubit.dart';
import 'package:patterns_bloc/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ListPostCubit()),
        BlocProvider(create: (context) => ListPostCubit()),
      ], child: HomePage()),
    );
  }
}
//       home: BlocProvider(
//         create: (BuildContext context)=>ListPostCubit(),
//         child: const HomePage(),
//       )
//     );
//   }
// }


