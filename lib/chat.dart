import 'package:flutter/material.dart';

// import 'package:google_maps_webservice/places.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:flutter/material.dart'

// const kGoogleApiKey = "AIzaSyB7GZsqexofDFemhu8_hDYQf80DqFLQkW4";

class Address {
  String city = '';
  String locality = '';
  String address = '';
  String landmark = '';
}

const String _name = "Your Adress";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.city, this.locality, this.address, this.landmark});
  final String city, locality, address, landmark;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                city,
                style: TextStyle(fontSize: 12.0),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                locality,
                style: TextStyle(fontSize: 12.0),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                address,
                style: TextStyle(fontSize: 12.0),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                landmark,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  //modified
  @override 
  State createState() => new ChatScreenState(); 
}

// Add the ChatScreenState class definition in main.dart.

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[]; // new
  // final TextEditingController _textController = new TextEditingController();
  Address _data = new Address();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      // If the form is valid, we want to show a address
      // _buildShopTile(, _data.locality, _data.address, _data.landmark);
      ChatMessage message = new ChatMessage(
          city: _data.city,
          locality: _data.locality,
          address: _data.address,
          landmark: _data.landmark
          
          ); 
      setState(() {
        
        _messages.insert(0, message); 
      }); 
      print('Form save called');
      print('city ${_data.city}');
      print('locality ${_data.locality}');
      print('address ${_data.address}');
      print('landmark ${_data.landmark}');
    }
  }

  // void _handleSubmitted(String text) {
  //   // _textController.clear();
  //   ChatMessage message = new ChatMessage(
  //     
  //     text: text, 
  //   ); 
  //   setState(() {
  //     
  //     _messages.insert(0, message); 
  //   }); 
  // }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Address")),
      body: new Column(
        //modified
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(), //modified
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add New Address',
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
    );
  }
}

///
///
///
/// return  IconTheme(
//   data:  IconThemeData(color: Theme.of(context).accentColor), //
//   child:  Container(
//     //modified
//     margin: const EdgeInsets.symmetric(horizontal: 8.0),
//     child:  Row(
//       children: <Widget>[
//          Flexible(
//           child:  TextField(
//             controller: _textController,
//             onSubmitted: _handleSubmitted,
//             decoration:
//                  InputDecoration.collapsed(hintText: "Add an adress"),
//           ),
//         ),
//          Container(
//           margin:  EdgeInsets.symmetric(horizontal: 4.0),
//           child:  IconButton(
//               icon:  Icon(Icons.add),
//               onPressed: () => _handleSubmitted(_textController.text)),
//         ),
//       ],
//     ),
//   ), //
// );
