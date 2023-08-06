import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const name = 'theme_change_screen';
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeNotifierProvider).mode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema'),
        actions: [
          IconButton(
              onPressed: () {
                //ref.read(isMode.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toggleDarMode();
              },
              icon: Icon(
                  mode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    final List<Color> colors = ref.watch(colorListProvider);

    final int selectColor = ref.watch(themeNotifierProvider).selectedColor;
    //final int selectColor = ref.watch(selectColorProvider);




    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectColor,
          onChanged: (value) {
            //ref.read(selectColorProvider.notifier).state = index;

            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
