import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Order Your Pizza')),
          backgroundColor: Colors.amber,
        ),
        body: PizzaOrderForm(),
      ),
    );
  }
}

class PizzaOrderForm extends StatefulWidget {
  const PizzaOrderForm({super.key});

  @override
  State<PizzaOrderForm> createState() => _PizzaOrderFormState();
}

class _PizzaOrderFormState extends State<PizzaOrderForm> {
  String _pizzaSize = 'Medium';
  Map<String, bool> _toppings = {
    'Pepperoni': false,
    'Mushrooms': false,
    'Onions': false,
    'Olives': false,
  };
  double _spiciness = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Please select size:', style: TextStyle(fontSize: 17)),
          RadioListTile(
            value: 'small',
            activeColor: Colors.amber,
            title: Text('Small'),
            groupValue: _pizzaSize,
            onChanged: (value) {
              setState(() {
                _pizzaSize = value!;
              });
            },
          ),
          RadioListTile(
            value: 'medium',
            title: Text('Medium'),
            activeColor: Colors.blueAccent,
            groupValue: _pizzaSize,
            onChanged: (value) {
              setState(() {
                _pizzaSize = value!;
              });
            },
          ),
          RadioListTile(
            value: 'large',
            title: Text('Large'),
            activeColor: Colors.black,
            groupValue: _pizzaSize,
            onChanged: (value) {
              setState(() {
                _pizzaSize = value!;
              });
            },
          ),
          SizedBox(height: 8),
          Text('Select Toppings:', style: TextStyle(fontSize: 17)),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _toppings['Pepperoni'],
            title: Text('Pepperoni'),
            onChanged: (bool? value) {
              setState(() {
                _toppings['Pepperoni'] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _toppings['Mushrooms'],
            title: Text('Mushrooms'),
            onChanged: (bool? value) {
              setState(() {
                _toppings['Mushrooms'] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _toppings['Onions'],
            title: Text('Onions'),
            onChanged: (bool? value) {
              setState(() {
                _toppings['Onions'] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _toppings['Olives'],
            title: Text('Olives'),
            onChanged: (bool? value) {
              setState(() {
                _toppings['Olives'] = value ?? false;
              });
            },
          ),
          Text('Spiciness Level'),
          Text(
            'Spiciness: ${_spiciness.toInt()}',
            style: TextStyle(fontSize: 10),
          ),
          Slider(
            value: _spiciness,
            min: 1.0,
            max: 10,
            onChanged: (double value) {
              setState(() {
                _spiciness = value;
              });
            },
          ),
          Divider(color: Colors.grey, thickness: 1),
          Text(
            'Your Order: A $_pizzaSize is selected toppings, spiciness level ${_spiciness.toInt()}',
          ),
        ],
      ),
    );
  }
}
