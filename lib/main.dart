import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jupiter facts',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('تطبيق نجم')),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Space background image
            Image.network(
              'https://cdn1-m.zahratalkhaleej.ae/store/archive/image/2023/4/12/fa4b8855-2172-4b40-bcb6-ac349262ae94.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Message text with white color
            const Text(
              'مرحبا في كوكب المشتري',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the "Enjoy the Trip" page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoPage()),
                );
              },
              child: const Text('★استمتعوا بالرحلة يانجوم★'),
            ),
            SizedBox(height: 20),
            // Button to navigate to the "Calculate Age on Jupiter" page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeCalculatorPage()),
                );
              },
              child: Text('احسب عمرك على كوكب المشتري'),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoPage extends StatelessWidget {
  final List<String> photoUrls = [
    'https://www.ar-universe.com/images/our_solar_system/jupiter_earth_comparison.jpg',
    'https://cdn.alweb.com/thumbs/alkaoun/article/fit710x532/%D9%83%D9%85-%D8%B9%D8%AF%D8%AF-%D9%83%D9%88%D8%A7%D9%83%D8%A8-%D8%A7%D9%84%D9%85%D8%AC%D9%85%D9%88%D8%B9%D8%A9-%D8%A7%D9%84%D8%B4%D9%85%D8%B3%D9%8A%D8%A9.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/0/07/PIA01627_Ringe-ar.jpg',
  ];

  final List<String> photoTexts = [
    'يمكن للمشتري استيعاب \nأكثر من 1300 كوكب أرضي',
    'السنة على المشتري=11.862 سنة أرضية \n ذلك بسبب سرعة دوران كوكب المشتري \nفهو يكمل دوره كامله حول محوره في اقل من 10 ساعات',
    'يحتوي كوكب المشتري على ثلاث حلقات،\n تم اكتشافها حول خط استواء\n الكوكب في عام 1979. وهذه الحلقات أكثر خفوتًا،\n وبالتالي، ليست مرئية مثل حلقات زحل'
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رجوع'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          photoUrls.length,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Photo
              Image.network(
                photoUrls[index],
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height * 0.75,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              // Text with white color
              Text(
                photoTexts[index],
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeCalculatorPage extends StatefulWidget {
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  TextEditingController ageController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العودة'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Textfield for entering age
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'ادخل عمرك بالسنوات الأرضية',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Button to calculate age on Jupiter
            ElevatedButton(
              onPressed: () {
                // Calculate age on Jupiter
                double age = double.tryParse(ageController.text) ?? 0;
                double ageOnJupiter = age / 11.862;
                setState(() {
                  result =
                      'عمرك ${ageOnJupiter.toStringAsFixed(2)} سنه على كوكب المشتري';
                });
              },
              child: Text('احسب'),
            ),
            SizedBox(height: 20),
            // Result text
            Text(
              result,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}