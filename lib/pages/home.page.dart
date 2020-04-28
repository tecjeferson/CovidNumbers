import 'package:covidenumbers/model/api.dart';
import 'package:covidenumbers/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class ApiRest extends StatefulWidget {
  ApiRest({Key key}) : super(key: key);

  @override
  _ApiRest createState() => _ApiRest();
}

class _ApiRest extends State<ApiRest> {
  Future<List<CovidModel>> covideFuture;
  LoginRepository _repository;

  var now = formatDate(DateTime.now(), [HH, ':', nn, ':', ss]).toString();
  var today = formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]).toString();

  @override
  void initState() {
    super.initState();
    _repository = LoginRepository();
    covideFuture = _repository.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/virus-bkg.png',
              ),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(children: [
                  Text('Brasil',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(today,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  Text(now,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ]),
                Image(
                  image: AssetImage(
                    'assets/people-mask.png',
                  ),
                  height: 120,
                ),
              ]),
              FutureBuilder(
                future: this.covideFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<CovidModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('no data'),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.error_outline),
                          //Text('#########Error:')
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo[200],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0))),
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int i) {
                              var item = snapshot.data[i];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 0.5,
                                              spreadRadius: 0.5,
                                              offset: Offset(3.0, 3.0),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(
                                          'Casos confirmados',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          item.confirmed.toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 0.5,
                                              spreadRadius: 0.5,
                                              offset: Offset(3.0, 3.0),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(
                                          'Casos Recuperados',
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          item.recovered.toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 0.5,
                                              spreadRadius: 0.5,
                                              offset: Offset(3.0, 3.0),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(
                                          'Casos Criticos',
                                          style: TextStyle(
                                              color: Colors.orange[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          item.critical.toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 0.5,
                                              spreadRadius: 0.5,
                                              offset: Offset(3.0, 3.0),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(
                                          'Casos Fatais',
                                          style: TextStyle(
                                              color: Colors.red[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          item.deaths.toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                    //Center(child: Text('Funcionando'));
                  }
                },
                //print('Chegou dados no apirest ?? ${snapshot.hasData}');
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//       itemCount: snapshot.data.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('oii'),
//         );
//       });
// class ListDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: snapshot.data.length,
//         itemBuilder: (_, index) {
//           var item = snapshot.data[index];
//           print('###########  AQUIIIII  ${snapshot.data}');
//           return
//         });
//   }
// }
