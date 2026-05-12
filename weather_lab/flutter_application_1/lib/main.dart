import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  late Future<Weather> _weatherFuture;

  // ✅ Controllers for input
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lonController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Default London weather
    _weatherFuture = _weatherService.fetchWeather(51.5074, -0.1278);
  }

Future<void> _searchByCity() async {
  try {
    final coords = await _weatherService.getCoordinates(_cityController.text);

    setState(() {
      _weatherFuture = _weatherService.fetchWeather(
        coords['lat']!,
        coords['lon']!,
      );
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString())),
    );
  }
}


  // ✅ Function for searching using lat/lon
  void _searchWeather() {
    final lat = double.tryParse(_latController.text);
    final lon = double.tryParse(_lonController.text);

    if (lat != null && lon != null) {
      setState(() {
        _weatherFuture = _weatherService.fetchWeather(lat, lon);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid numbers")),
      );
    }
  }

  // Optional refresh button
  void _refreshWeather() {
    setState(() {
      _weatherFuture = _weatherService.fetchWeather(51.5074, -0.1278);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshWeather,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
  controller: _cityController,
  decoration: InputDecoration(
    labelText: 'Enter City Name',
    border: OutlineInputBorder(),
  ),
),

SizedBox(height: 10),

ElevatedButton(
  onPressed: _searchByCity,
  child: Text("Search by City"),
),

SizedBox(height: 20),

            // ✅ Latitude input
            TextField(
              controller: _latController,
              decoration: const InputDecoration(labelText: 'Latitude'),
              keyboardType: TextInputType.number,
            ),

            // ✅ Longitude input
            TextField(
              controller: _lonController,
              decoration: const InputDecoration(labelText: 'Longitude'),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10),

            // ✅ Search button
            ElevatedButton(
              onPressed: _searchWeather,
              child: const Text("Search Weather"),
            ),

            const SizedBox(height: 20),

            // ✅ Weather display
            Expanded(
              child: FutureBuilder<Weather>(
                future: _weatherFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } 
                  else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } 
                  else if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weather.cityName,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${weather.temperature.toStringAsFixed(1)}°C',
                          style: const TextStyle(fontSize: 50),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          weather.description.toUpperCase(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    );
                  }

                  return const Center(child: Text('No data available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}