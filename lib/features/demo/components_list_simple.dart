import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ComponentsListSimple extends ConsumerWidget {
  const ComponentsListSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(colorStorageProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SingleChoice(),
          Text(storage.asData?.value.toString() ?? ''),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavRailExample(),
              Buttons(),
            ],
          ),
          const CardExample(),
          // DropdownMenuExample(),
          const ActionChoiceExample(),
        ],
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text('Minimalist'),
                TextButton(
                  onPressed: () => context.push('/themer_minimalist'),
                  child: const Text('GO'),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text('Stones'),
                TextButton(
                  onPressed: () => context.push('/themer_stones'),
                  child: const Text('GO'),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text('Square'),
                TextButton(
                  onPressed: () => context.push('/themer_square'),
                  child: const Text('GO'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
        const SizedBox(height: 5),
        FilledButton(onPressed: () {}, child: const Text('Filled')),
        const SizedBox(height: 5),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
        // Row(
        //   children: [
        //     ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
        //     const SizedBox(width: 20),
        //     OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
        //   ],
        // ),
        // const SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')),
        //     TextButton(onPressed: () {}, child: const Text('TextButton')),
        //     FilledButton(onPressed: () {}, child: const Text('Filled')),
        //   ],
        // )
      ],
    );
  }
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 100,
      initialSelection: list.first,
      onSelected: (String? value) => setState(() => dropdownValue = value!),
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month),
        ),
        // ButtonSegment<Calendar>(
        //   value: Calendar.year,
        //   label: Text('Year'),
        //   icon: Icon(Icons.calendar_today),
        // ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() => calendarView = newSelection.first);
      },
    );
  }
}

class ActionChoiceExample extends StatefulWidget {
  const ActionChoiceExample({super.key});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              3,
              (int index) {
                return ChoiceChip(
                  label: Text('Item $index'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() => _value = selected ? index : null);
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class NavRailExample extends StatefulWidget {
  const NavRailExample({super.key});

  @override
  State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 250,
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() => _selectedIndex = index);
            },
            labelType: labelType,
            leading: showLeading
                ? FloatingActionButton(elevation: 0, onPressed: () {}, child: const Icon(Icons.add))
                : const SizedBox(),
            trailing: showTrailing
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
                : const SizedBox(),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
        ],
      ),
    );
  }
}
