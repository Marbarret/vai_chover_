import 'package:flutter/material.dart';

import '../data/my_data.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherApiClient apiClient = WeatherApiClient();
  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    // Chame a função para obter dados meteorológicos quando o widget for inicializado
    _getWeatherData();
  }

  Future<void> _getWeatherData() async {
    try {
      final data = await apiClient.getWeather(
          -22.9064, -47.0616); // Substitua 0.0 pelos valores reais
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      print("Error fetching weather data: $e");
      // Lidar com erros, por exemplo, exibindo um snackbar ou uma mensagem na tela
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: weatherData.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temperature: ${weatherData['main']['temp']}'),
                  Text(
                      'Description: ${weatherData['weather'][0]['description']}'),
                  // Adicione mais widgets para exibir outros dados meteorológicos conforme necessário
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WeatherScreen(),
  ));
}


// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class InitialScreen extends StatelessWidget {
//   const InitialScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarBrightness: Brightness.dark,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(40, 1.5 * kToolbarHeight, 40, 20),
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: const AlignmentDirectional(10, -0.03),
//                 child: Container(
//                   height: 300,
//                   width: 300,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(-10, -0.03),
//                 child: Container(
//                   height: 300,
//                   width: 300,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(0, -1.2),
//                 child: Container(
//                   height: 300,
//                   width: 600,
//                   decoration: const BoxDecoration(
//                     color: Colors.yellow,
//                   ),
//                 ),
//               ),
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 100.0),
//                 child: Container(
//                   decoration: const BoxDecoration(color: Colors.transparent),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Campinas / SP",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Bom dia',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25),
//                     ),
//                     Image.asset('assets/imgs/1.png'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
