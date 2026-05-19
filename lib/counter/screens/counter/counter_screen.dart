import 'package:flutter/material.dart';
import 'package:to_do_list_app/counter/utils/counter_storage_services.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter=0;
  bool _isLoading=true;

  @override
  void initState() {
    super.initState();
_initCounter();
  }
 Future<void> _initCounter()async{
 final savedValue = await CounterStorageServices.loadCounter();
 setState(() {
   _counter=savedValue;
   _isLoading=false;
 });
  }
  
 Future<void> _handleCounterUpdate(int newValue)async{
setState(() {
  _counter=newValue;
});
await CounterStorageServices.saveCounter(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent Counter'),
      ),
      body: _isLoading ? const Center(child:  CircularProgressIndicator(),)
      :Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you have pushed the button "$_counter" times:',
            style: const TextStyle(fontSize: 16),
            ),
            Text('$_counter',
            style: const TextStyle(fontSize: 48,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: _isLoading ?null :
      Row(mainAxisAlignment: MainAxisAlignment.end,

        children: [
      FloatingActionButton(
        heroTag: 'minus',
        onPressed: ()=>_handleCounterUpdate(_counter-1)
        ,child: const Icon(Icons.remove),
        ),
        const SizedBox(width:16 ,),
          FloatingActionButton(
        heroTag: 'plus',
        onPressed: ()=>_handleCounterUpdate(_counter+1)
        ,child: const Icon(Icons.add),
        ),
      ],),
    );
  }
}