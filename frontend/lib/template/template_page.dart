import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_project/service/database_helper.dart';
import 'template_bloc.dart';


class TemplatePage extends StatelessWidget {
  final TemplateBloc _templateBloc = TemplateBloc();

  TemplatePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template'),
      ),
      body: BlocBuilder<TemplateBloc, TemplateState>(
        bloc: _templateBloc,
        builder: (context, state) {
          return FutureBuilder<String>(
            // future: DatabaseHelper.getTemplate(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Error retrieving template');
              } else {
                String currentTemplate = snapshot.data ?? 'template1.html';
                return GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _templateBloc.add(SelectTemplateEvent(1));
                        // DatabaseHelper.updateTemplate('template1.html');
                      },
                      child: Card(
                        child: WebView(
                          initialUrl: 'http://localhost:8080/assets/$currentTemplate',
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _templateBloc.add(SelectTemplateEvent(2));
                        // DatabaseHelper.updateTemplate('template2.html');
                      },
                      child: Card(
                        child: WebView(
                          initialUrl: 'http://localhost:8080/assets/$currentTemplate',
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
