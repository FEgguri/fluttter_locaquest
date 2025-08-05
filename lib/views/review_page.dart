import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/review_view_model.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final double mapX;
  final double mapY;

  const ReviewPage({super.key, required this.mapX, required this.mapY});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final vm = ref.read(reviewProvider.notifier);
      vm.setCoordinates(widget.mapX, widget.mapY);
      vm.loadReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviews = ref.watch(reviewProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('리뷰')),
      body: Column(
        children: [
          Expanded(
            child: reviews.when(
              data: (list) => list.isEmpty
                  ? const Center(child: Text("리뷰가 없습니다"))
                  : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, idx) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 218, 218, 218)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(list[idx].content),
                                subtitle: Text(list[idx].createdAt.toString()),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('오류 발생: $e')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    final content = _controller.text.trim();
                    if (content.isNotEmpty) {
                      await ref
                          .read(reviewProvider.notifier)
                          .addReview(content);
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
