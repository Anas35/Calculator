import 'package:calculator/src/converter/type.dart';
import 'package:calculator/widgets/custom_widget/converter_keyboard.dart';
import 'package:calculator/widgets/custom_widget/keyboard_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Converter Keyword', () {

    testWidgets('widget length', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard<Length>(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {},
                ),
              )
            ),
          ),
      );

      await tester.pumpAndSettle();

      expect(tester.renderObjectList<RenderBox>(find.byType(ElevatedButton)), hasLength(13));
      expect(tester.renderObjectList<RenderBox>(find.byKey(Key('SizedBox'))), hasLength(2));
      expect(tester.renderObjectList<RenderBox>(find.widgetWithIcon(ElevatedButton, Icons.close_sharp)), hasLength(1));

    });

    testWidgets('widget length with generic Type', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard<Temperature>(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {},
                ),
              ),
            ),
          ),
      );

      await tester.pumpAndSettle();

      expect(tester.renderObjectList<RenderBox>(find.byType(ElevatedButton)), hasLength(14));
      expect(tester.renderObjectList<RenderBox>(find.byKey(Key('SizedBox'))), hasLength(1));
      expect(tester.renderObjectList<RenderBox>(find.widgetWithIcon(ElevatedButton, Icons.close_sharp)), hasLength(1));

    });

    testWidgets('colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        Material(
         child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Container(
              width: 200,
              child: ConverterKeyboard(
                keyboardController: KeyboardController(),
                    getInputNumbers: (String numbers) {},
                  ),
                )
              ),
            ),
        ),
      );
      
      await tester.pumpAndSettle();

    Material material(int index) => tester.widget<Material>(find.descendant(
      of: find.byType(ElevatedButton).at(index),
      matching: find.byType(Material),
    ));

      for(int i = 0; i < 11; i++){
        expect(material(i).color, Colors.black.withOpacity(0.75));
      }
      expect(material(12).color, Colors.black.withOpacity(0.50));
      expect(material(11).color, Colors.black.withOpacity(0.50));

    });

    testWidgets('text update', (WidgetTester tester) async {

      String text = '0';

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {
                    text = numbers;
                  },
                ),
              )
            ),
          ),
      );

      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      expect(text, '1');

      await tester.tap(find.text('5'));
      await tester.pumpAndSettle();
      expect(text, '15');
    });

    testWidgets('dot', (WidgetTester tester) async {

      String text = '0';

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(builder: (BuildContext context) {
              return ConverterKeyboard(
                keyboardController: KeyboardController(),
                getInputNumbers: (String numbers) {
                  text = numbers;
                },
              );
            }),
          ),
        ),
      );

      await tester.tap(find.text('.'));
      await tester.pumpAndSettle();
      expect(text, '0.');

      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      expect(text, '0.1');

      await tester.tap(find.text('.'));
      await tester.pumpAndSettle();
      expect(text, '0.1');
    });

    testWidgets('delete text', (WidgetTester tester) async {
      
      String text = '0';

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {
                    text = numbers;
                  },
                ),
              )
            ),
          ),
      );
      await tester.tap(find.text('1'));
      expect(text, '1');

      await tester.tap(find.text('2'));
      expect(text, '12');

      await tester.tap(find.widgetWithIcon(ElevatedButton, Icons.close_sharp));
      expect(text, '1');
    });

    testWidgets('clear all', (WidgetTester tester) async {

      String text = '123';

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {
                    text = numbers;
                  },
                ),
              )
            ),
          ),
      );

      await tester.tap(find.text('CE'));
      expect(text, '0');

    });

    testWidgets('sign', (WidgetTester tester) async {

      String text = '0';

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 200,
            child: ConverterKeyboard<Angle>(
              keyboardController: KeyboardController(),
                  getInputNumbers: (String numbers) {
                    text = numbers;
                  },
                ),
              )
            ),
          ),
      );

      await tester.tap(find.text('1'));
      expect(text, '1');

      await tester.tap(find.text('+/-'));
      expect(text, '-1');

      await tester.tap(find.text('+/-'));
      expect(text, '1');

    });
  });
}
