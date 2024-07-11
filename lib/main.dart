import 'package:flutter/material.dart';
import 'package:qoreidsdk/qoreidsdk.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _qoreidsdkResult();
  }

  void _qoreidsdkResult() async {
    Qoreidsdk.onResult((result) async {
      print(result);
    });
  }

  void _launchQoreid() async {
    // POSSIBLE DATA FORMATE
    /**



    **/
    
    // Launch Qoreid app
    QoreidData data = QoreidData(
        clientId: "PNQPGQCONMC80MOPAYUW", //required
        flowId: 577,
        customerReference: "cus-ref", //required
        productCode: "", //required required for collection
        addressData: {},
        applicantData: {},
        ocrAcceptedDocuments: "",
        identityData: {});
    await Qoreidsdk.launchQoreid(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Qoreidsdk Exampple',
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _launchQoreid,
                child: const Text('Launch QoreId'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
