// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
// import 'package:my_shares/pages/list.dart';
// import 'package:my_shares/setup/sharesList.dart';

// class FuttureBuilder extends StatelessWidget {
//   const FuttureBuilder({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ListShares>>(
//       future: fetchShares(http.Client()),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) print(snapshot.error);
//         return snapshot.hasData
//             ? ShaList(stock: snapshot.data)
//             : Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }