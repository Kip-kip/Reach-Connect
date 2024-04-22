import 'package:bridgme/app/modules/chat/dialog/dialogs_screen_controller.dart';
import 'package:bridgme/app/modules/home/modules/chatroom/create_chat/create_chat_binding.dart';
import 'package:bridgme/app/modules/home/modules/chatroom/create_chat/create_chat_view.dart';
import 'package:bridgme/app/modules/home/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:bridgme/app/modules/home/modules/dialogs/dialogs_view.dart';
import 'package:bridgme/app/modules/home/modules/dialogs/inbox/binding/inbox_binding.dart';
import 'package:bridgme/app/modules/home/modules/dialogs/inbox/inbox_tab.dart';
import 'package:bridgme/app/modules/home/modules/profile/edit_profile/bindings/edit_profile_binding.dart';
import 'package:bridgme/app/modules/home/modules/profile/edit_profile/controllers/edit_profile_logic.dart';
import 'package:bridgme/app/modules/home/modules/stories/views/story_view.dart';
import 'package:bridgme/app/modules/post/binding/article_binding.dart';
import 'package:bridgme/app/modules/post/views/article_list_screen.dart';
import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/filter/bindings/filter_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/filter/views/filter_view.dart';
import '../modules/home/modules/appointments/appointment_booking/step1/views/healthcare_concern_view.dart';
import '../modules/home/modules/appointments/appointment_booking/step2/bindings/choose_doctor_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/step2/views/choose_doctor_view.dart';
import '../modules/home/modules/appointments/appointment_booking/step3/bindings/time_slot_page_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/step3/views/time_slot_view.dart';
import '../modules/home/modules/appointments/appointment_booking/step4/bindings/patient_details_page_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/step4/views/patient_details_view.dart';
import '../modules/home/modules/appointments/appointment_booking/step5/bindings/appointment_booked_page_binding.dart';
import '../modules/home/modules/appointments/appointment_booking/step5/views/appointment_booked_view.dart';
import '../modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/bindings/my_appointments_binding.dart';
import '../modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/views/my_appointments_view.dart';
import '../modules/home/modules/appointments/appointment_info/details/bindings/appointment_detail_page_binding.dart';
import '../modules/home/modules/appointments/appointment_info/details/views/appointment_detail_view.dart';
import '../modules/home/modules/chatroom/chat_room_details/bindings/chatroom_details_binding.dart';
import '../modules/home/modules/chatroom/chat_room_details/views/chatroom_details_view.dart';
import '../modules/home/modules/chatroom/chatroom_binding.dart';
import '../modules/home/modules/chatroom/chatroom_view.dart';
import '../modules/home/modules/counsellor/counsellor_list/bindings/counsellor_list_page_binding.dart';
import '../modules/home/modules/counsellor/counsellor_list/views/counsellor_list_view.dart';
import '../modules/home/modules/counsellor/counsellor_profile/bindings/counsellor_profile_page_binding.dart';
import '../modules/home/modules/counsellor/counsellor_profile/views/counsellor_profile_view.dart';
import '../modules/home/modules/dashboard/views/dashboard_view.dart';
import '../modules/home/modules/dialogs/dialogs_binding.dart';
import '../modules/home/modules/journals/journals_details/bindings/journals_details_binding.dart';
import '../modules/home/modules/journals/journals_details/views/journal_details_view.dart';
import '../modules/home/modules/notification/bindings/notification_binding.dart';
import '../modules/home/modules/notification/views/notification_view.dart';
import '../modules/home/modules/profile/edit_profile/views/edit_profile_view.dart';
import '../modules/home/modules/profile/views/profile_view.dart';
import '../modules/home/modules/survey/survey_intro/survey_intro_binding.dart';
import '../modules/home/modules/survey/survey_intro/survey_intro_view.dart';
import '../modules/home/modules/survey/survey_questions/survey_questions_binding.dart';
import '../modules/home/modules/survey/survey_questions/survey_questions_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.COUNSELLORLIST;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
            middlewares: [
              EnsureNotAuthedMiddleware(),
            ],
            name: _Paths.LOGIN,
            page: () => LoginView(),
            binding: LoginBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [],
            name: _Paths.REGISTER,
            page: () => RegisterView(),
            binding: RegisterBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [],
            name: _Paths.FORGOT_PASSWORD,
            page: () => ForgotPasswordPage(),
            binding: ForgotPasswordBinding(),
            transition: Transition.downToUp),
        GetPage(
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => HomeView(),
          middlewares: [
            //only enter this route when authed
            // EnsureAuthMiddleware(),
          ],
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.DASHBOARD,
              page: () => DashboardPage(),
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              transition: Transition.zoom,
              // binding: DashboardBinding(),

            ),


            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.PROFILE,
              page: () => ProfilePage(),
              title: 'Profile',
              transition: Transition.circularReveal,
              // binding: ProfileBinding(),
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                // EnsureAuthMiddleware(),
              ],
              name: _Paths.CHATROOM,
              page: () => ChatroomPage(),
              title: 'Chatroom',
              transition: Transition.fadeIn,
              binding: ChatroomBinding(),
            ),

            GetPage(
              middlewares: [
                //only enter this route when authed
                // EnsureAuthMiddleware(),
              ],
              name: _Paths.CHAT_DIALOGS,
              page: () => DialogPage(),
              title: 'Chat Dialogs',
              transition: Transition.fadeIn,
              binding: DialogsBinding(),
            ),
          ],
        ),
        GetPage(
            middlewares: [EnsureAuthMiddleware()],
            name: _Paths.NOTIFICATION,
            page: () => NotificationsPage(),
            binding: NotificationBinding(),
            transition: Transition.downToUp),
        GetPage(
          middlewares: [
            //only enter this route when authed
            // EnsureAuthMiddleware(),
          ],
          name: _Paths.HEALTHCARE_CONCERN,
          page: () => HealthcareConcernPage(),
          title: 'Chat Dialogs',
          transition: Transition.fadeIn,
          binding: DialogsBinding(),
        ),
        GetPage(
            middlewares: [EnsureAuthMiddleware()],
            name: _Paths.EDIT_PROFILE,
            page: () => EditProfilePage(),
            binding: EditProfileBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [EnsureAuthMiddleware()],
            name: _Paths.CHOOSE_DOCTOR,
            page: () => ChooseDoctorPage(),
            binding: ChooseDoctorBinding(),
            transition: Transition.fadeIn),
        GetPage(
            middlewares: [EnsureAuthMiddleware()],
            name: _Paths.FILTER,
            page: () => FilterPage(),
            binding: FilterBinding(),
            transition: Transition.fadeIn),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.COUNSELLORLIST,
            page: () => CounsellorListPage(),
            binding: CounsellorListPageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.COUNSELLORPROFILE,
            page: () => CounsellorProfilePage(),
            binding: CounsellorProfilePageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.TIME_SLOT_PAGE,
            page: () => TimeSlotPage(),
            binding: TimeSlotPageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.PATIENT_DETAILS_PAGE,
            page: () => PatientDetailsPage(),
            binding: PatientDetailsPageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              EnsureAuthMiddleware()
            ],
            name: _Paths.APPOINTMENT_BOOKED_PAGE,
            page: () => AppointmentBookedPage(),
            binding: AppointmentBookedPageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.APPOINTMENT_DETAIL,
            page: () => AppointmentDetailPage(),
            binding: AppointmentDetailPageBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.MY_APPOINTMENTS,
            page: () => MyAppointmentsPage(),
            binding: MyAppointmentsBinding(),
            transition: Transition.downToUp),

        GetPage(
            middlewares: [EnsureAuthMiddleware()],
            name: _Paths.JOURNAL_DETAILS,
            page: () => JournalDetailsPage(),
            binding: JournalsDetailsBinding(),
            transition: Transition.downToUp),
        GetPage(
            middlewares: [
              // EnsureAuthMiddleware()
            ],
            name: _Paths.MY_APPOINTMENTS,
            page: () => MyAppointmentsPage(),
            binding: MyAppointmentsBinding(),
            transition: Transition.downToUp),
        GetPage(
          name: Routes.SURVEY_INTRO,
          page: () => SurveyIntroPage(),
          binding: SurveyIntroPageBinding(),
        ),
        GetPage(
          name: Routes.SURVEY_QUESTIONS,
          page: () => SurveyQuestionsPage(),
          binding: SurveyQuestionsPageBinding(),
        ),
        GetPage(
          name: Routes.ARTICLES,
          page: () => ArticleScreenList(),
          binding: ArticleListBinding(),
        ),
        GetPage(
          middlewares: [
            //only enter this route when authed
            //
          ],
          name: _Paths.CHATROOM_DETAILS,
          page: () => ChatroomDetailsPage(),
          title: 'Chatroom',
          transition: Transition.fadeIn,
          binding: ChatroomDetailsBinding(),
        ),

        GetPage(
          middlewares: [
            //only enter this route when authed
            //
          ],
          name: _Paths.USER_STORIES,
          page: () => StoryScreen(),
          transition: Transition.fadeIn,
          binding: DashboardBinding()
        ),
        GetPage(
            middlewares: [ ],
            name: _Paths.INBOX,
            page: () => InboxTab(),
            transition: Transition.fadeIn,
            binding: InboxBinding()
        ),

        GetPage(
            middlewares: [ ],
            name: _Paths.NEW_CHAT_ROOM,
            page: () => Create_chatPage(),
            transition: Transition.fadeIn,
            binding: Create_chatBinding()
        ),
      ],
    ),
  ];
}