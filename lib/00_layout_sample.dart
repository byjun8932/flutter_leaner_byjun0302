import 'package:flutter/material.dart';
import 'package:flutter_leanr_byjun0302/data_source/idol_data_source.dart';
import 'package:flutter_leanr_byjun0302/repository/idol_repository_impl.dart';
import 'package:flutter_leanr_byjun0302/repository/idol_repositroy.dart';

import 'component/info_card.dart';

void main() {
  runApp(const TutorialApp());
}

class TutorialApp extends StatelessWidget {
  const TutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 튜토리얼 가즈앙',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: newLayout(
        idolRepository: IdolRepositoryImpl(IdolDataSource()),
      ),
    );
  }
}

class newLayout extends StatefulWidget {
  final IdolRepository idolRepository;

  const newLayout({
    super.key,
    required this.idolRepository,
  });

  @override
  State<newLayout> createState() => _newLayoutState();
}

class _newLayoutState extends State<newLayout> {
  final Set<int> _favoriteIdolIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: const Text('열심히 하는 당신은 언젠가 즐거워질 것이다.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.idolRepository
              .getIdols()
              .map((idol) => InfoCard(
                    idol: idol,
                    isFavorite: _favoriteIdolIds.contains(idol.id),
                    onPressedFavoritePressed: (idol) {
                      setState(() {
                        if (_favoriteIdolIds.contains(idol.id)) {
                          _favoriteIdolIds.remove(idol.id);
                        } else {
                          _favoriteIdolIds.add(idol.id);
                        }
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
