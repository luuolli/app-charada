import 'package:charadas/screens/home/home_module.dart';
import 'package:charadas/shared/models/charada.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = HomeModule.to.getBloc<HomeBloc>();
    // bloc.aleatorio();
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(
        width: size.width,
        child: StreamBuilder<HomeBloc>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Text(
                    "Charadinhas aleatórias",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.display3.copyWith(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                );
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Wrap(
                      runSpacing: 40,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      // direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          snapshot.data.charada.pergunta,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.display1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        if (!snapshot.data.hiddenResponse)
                          Text(
                            snapshot.data.charada.resposta,
                            textAlign: TextAlign.justify,
                            style: theme.textTheme.subtitle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: StreamBuilder<HomeBloc>(
        initialData: bloc,
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return FlatButton(
              color: Colors.deepPurpleAccent[300],
              child: Text(
                "Iniciar",
                style: theme.textTheme.button.copyWith(color: Colors.white),
              ),
              onPressed: bloc.aleatorio,
            );
          if (snapshot.data.hiddenResponse)
            return FlatButton(
              color: Colors.deepPurpleAccent[300],
              child: Text(
                "Ver resposta",
                style: theme.textTheme.button.copyWith(color: Colors.white),
              ),
              onPressed: bloc.showHideResponse,
            );
          return FlatButton(
            color: Colors.deepPurpleAccent[300],
            child: Text(
              "PRÓXIMO",
              style: theme.textTheme.button.copyWith(color: Colors.white),
            ),
            onPressed: bloc.aleatorio,
          );
        },
      ),
    );
  }
}
