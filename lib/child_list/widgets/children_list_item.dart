import 'package:flutter/material.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:routemaster/routemaster.dart' as routemaster;
// import 'package:routemaster/routemaster.dart' as routemaster;

class ChildrenListItem extends StatelessWidget {
  const ChildrenListItem({required this.children, super.key});

  final ChildModel children;

  @override
  Widget build(BuildContext context) {

    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(children.childDateTime);
    int days = difference.inDays;
    // Определяем текст для отображения в зависимости от разницы во времени
    String ageText;
    if (days < 7) {
      ageText = '$days дней';
    } else if(days < 30){
      int weeks = (days/7).floor();
      ageText = '$weeks недель';
    } else if (days < 365) {
      int months = (days/30).floor();
      int weeks = ((days % 30)/7).floor();
     ageText = '$months месяцев $weeks недель';
    } else {
     int years = (days / 365).floor();
      int months = (((days % 365) - ((days % 365) % 30))/ 30).floor();
      ageText = '$years лет, $months месяцев';
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: (){
          routemaster.Routemaster.of(context).push('/add/${children.id}');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 1),
            ),
          padding: const EdgeInsets.all(8.0),
          height: 200,
          width: double.infinity,
          child: Column(children: [
            Text(children.name,
            style: Theme.of(context).textTheme.titleLarge,),
            Text(ageText),
            Text(children.gender ? 'Мальчик' : 'Девочка')
          ]),
        ),
      ),
    );
  }
}
