// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../shared/components/utility/story_circle.dart';
// import '../controllers/dashboard_controller.dart';
// import '../widgets/next_appointment_widget.dart';
// import '../widgets/no_appointments_widget.dart';
// import '../widgets/section_header_widget.dart';
// import '../widgets/test_and_prescription_card_widget.dart';
// import '../widgets/visited_counsellor_list_item.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage>
//     with AutomaticKeepAliveClientMixin<DashboardPage> {
//   final bool _noAppoints = false;
//   DashboardController controller = Get.put(DashboardController());
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: CustomScrollView(
//                 shrinkWrap: true,
//                 slivers: [
//                   SliverToBoxAdapter(
//                       child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(width: 1, color: Colors.grey[300]!),
//                       ),
//                     ),
//                     height: MediaQuery.of(context).size.height * 0.17,
//                     child: ListView.builder(
//                         itemCount: controller.users.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           if (index == 0) {
//                             return Container();
//                           } else {
//                             return StoryCircle(
//                                 press: () {
//                                   print("onclick called for screen");
//                                 },
//                                 user: controller.users[index],
//                                 size: 75,
//                                 tickBorder: 3.0);
//                           }
//                         }),
//                   ))
//                 ],
//               ),
//             ),
//             _noAppoints
//                 ? NoAppointmentsWidget()
//                 : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: <Widget>[
//                             SectionHeaderWidget(
//                               title: 'Next appointment',
//                             ),
//                             NextAppointmentWidget(),
//                             SectionHeaderWidget(
//                               title: 'Therapists you have seen',
//                               onPressed: () {
//                                 // Get.toNamed(Routes.COUNSELLORLIST);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 160,
//                         child: ListView.separated(
//                           separatorBuilder: (context, index) => SizedBox(
//                             width: 15,
//                           ),
//                           itemCount: controller.doctors.length,
//                           scrollDirection: Axis.horizontal,
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           itemBuilder: (context, index) {
//                             return VisitedCounsellorListItem(
//                               doctor: controller.doctors[index],
//                             );
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             SectionHeaderWidget(
//                               title: 'Top picks',
//                               onPressed: () {
//                                 // Get.toNamed(Routes.JOURNAL_LIST);
//                               },
//                             ),
//                             TestAndPrescriptionCardWidget(
//                               title: 'Mental Health',
//                               subtitle: 'How Do i know if I have OCD',
//                               image: 'love.png',
//                               onTap: () {
//                                 // Get.toNamed(Routes.JOURNAL_DETAILS);
//                               },
//                             ),
//
//                             TestAndPrescriptionCardWidget(
//                               title: 'Bipolar',
//                               subtitle:
//                                   '5 steps to avoid addiction to nicotine',
//                               image: 'medicine.png',
//                             ),
//                             //test results
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
