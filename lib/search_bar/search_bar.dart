import 'package:flutter/material.dart';

void main() => runApp(SearchBarPage());

const _searchList = ['demo-1', 'demo-2', 'foo', 'bar', 'henan', 'beijing'];

const _suggestions = [
  'suggestion1',
  'suggestion2',
  'suggestion3',
];

class SearchBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SearchBarWidget(),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: _SearchBarDelegate());
            },
          )
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SearchDelegate<String> {
  //  右侧图标
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  // 左侧图标
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Card(
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final _suggestionList = query.isEmpty
        ? _suggestions
        : _searchList.where((words) => words.startsWith(query)).toList();
    return ListView.builder(
        itemCount: _suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: RichText(
                text: TextSpan(
                    text: _suggestionList[index].substring(0, query.length),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: _suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])),
          );
        });
  }
}
