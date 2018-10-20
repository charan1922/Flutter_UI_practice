import 'package:flutter/material.dart';
import 'address.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Address {
  String city = '';
  String locality = '';
  String address = '';
  String landmark = '';
}

class _MyHomePageState extends State<MyHomePage> {
  Address _data = new Address();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      // If the form is valid, we want to show a address
      print('Form save called');
      print('city ${_data.city}');
      print('locality ${_data.locality}');
      print('address ${_data.address}');
      print('landmark ${_data.landmark}');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add  Address',
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    hintText: "Hyderabad",
                    labelText: "City",
                  ),
                  onSaved: (String value) {
                    this._data.city = value;
                  }),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.pin_drop),
                    hintText: "Sanjeeva Reddy Nagar, Hyderabad",
                    labelText: "Locality",
                  ),
                  onSaved: (String value) {
                    this._data.locality = value;
                  }),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.streetview),
                    hintText: "400/3RT, Aditya enclave",
                    labelText: "Address",
                  ),
                  onSaved: (String value) {
                    this._data.address = value;
                  }),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.tram),
                    hintText: "Near police station",
                    labelText: "Landmark",
                  ),
                  onSaved: (String value) {
                    this._data.landmark = value;
                  }),
              Container(
                  padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                  child: RaisedButton(
                    child: const Text('Save Address'),
                    onPressed: _submitForm,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
