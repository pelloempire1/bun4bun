import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/bun_service.dart';

class BunTestScreen extends StatefulWidget {
  const BunTestScreen({super.key});

  @override
  State<BunTestScreen> createState() => _BunTestScreenState();
}

class _BunTestScreenState extends State<BunTestScreen> {
  final _controller = TextEditingController();
  final _bunService = const BunService();
  bool _submitting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _submitting) return;

    setState(() {
      _submitting = true;
    });

    try {
      await _bunService.createBunPost(text);
      _controller.clear();
      Get.snackbar('Success', 'Bun spilled successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bun4Bun Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter bun text',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitting ? null : _submit,
                child: Text(_submitting ? 'Spilling...' : 'Spill Bun'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
