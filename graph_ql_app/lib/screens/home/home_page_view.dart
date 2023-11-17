import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graph_ql_app/screens/home/widget/dashed_widget.dart';
import 'package:graph_ql_app/screens/home/widget/expand_button_widget.dart';
import 'package:graph_ql_app/services/app_services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

HttpLink dataLink = HttpLink("https://rickandmortyapi.com/graphql");
GraphQLClient client = GraphQLClient(link: dataLink, cache: GraphQLCache());
fetchData() async {
  HttpLink dataLink = HttpLink("https://rickandmortyapi.com/graphql");
  GraphQLClient graphQLClient =
      GraphQLClient(link: dataLink, cache: GraphQLCache());
  QueryResult queryResult = await graphQLClient.query(QueryOptions(
    document: gql("""query {
  characters (){
  results {
    name
    image
  }
  }
}
"""),
  ));
  if (queryResult.hasException) {
    log('${queryResult.exception}');
  }

  List<dynamic> data = queryResult.data!['characters']['results'];
  if (data.isNotEmpty) {
    log("${queryResult.data!['characters']['results']}");
  }
}

deleteData() async {
  try {
    QueryResult queryResult = await client.mutate(MutationOptions(
      document: gql("""query {
  characters (){
  results {
    name
    image
  }
  }
}
"""),
    ));
  } catch (e) {}
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    AppServices.service.invoke('setAsBackground');
    AppServices.service.invoke('setAsForeground');
    // fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandButtonWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: DashedWidget()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
