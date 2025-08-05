import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttter_locaquest/common/app_bar.dart';
import 'package:fluttter_locaquest/viewmodels/location_view_model.dart';
import 'package:fluttter_locaquest/views/review_page.dart';
import 'package:fluttter_locaquest/widgets/empty_text.dart';
import 'package:fluttter_locaquest/widgets/location_tile.dart';

class HomePage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationViewModelProvider);

    return Scaffold(
      appBar: customAppBar(title: '지역 검색'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 218, 218, 218)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) =>
                    ref.read(locationViewModelProvider.notifier).search(value),
                decoration: InputDecoration(
                  hintText: '지역을 입력하세요',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => ref
                        .read(locationViewModelProvider.notifier)
                        .search(_controller.text),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: state.when(
              data: (locations) => locations.isEmpty
                  ? emptyText('검색 결과가 없습니다')
                  : ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final location = locations[index];
                        return LocationTile(
                          location: location,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ReviewPage(
                                  mapX: location.mapX,
                                  mapY: location.mapY,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('오류 발생: $e')),
            ),
          )
        ],
      ),
    );
  }
}
