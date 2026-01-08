import 'package:flutter/material.dart';
import '../../../../res/images.dart';
import '../widgets/app_header.dart';
import '../widgets/book_lab_test_banner.dart';
import '../widgets/bottom_navigation_menu.dart';
import '../widgets/carousel_banner.dart';
import '../widgets/diagnostic_imaging_gridview.dart';
import '../widgets/family_care_packages_autoplay_banner.dart';
import '../widgets/health_packages_grid.dart';
import '../widgets/holistic_womens_care_gridview.dart';
import '../widgets/routine_health_checkup_listview.dart';
import '../widgets/symptoms_section.dart';
import '../widgets/testservices.dart';
import '../widgets/top_booked_packages_listview.dart';
import '../widgets/top_packages_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });

    // Handle tab navigation
    switch (index) {
      case 0:
        // Home tab - already on home
        break;
      case 1:
        // Reports tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Reports')),
        );
        break;
      case 2:
        // Lab Tests tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Lab Tests')),
        );
        break;
      case 3:
        // Bookings tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Bookings')),
        );
        break;
      case 4:
        // Profile tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Profile')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppHeader(),
              SizedBox(height: 16),
              Row(
                children: [
                  TestServices(
                    imagePath: AppImages.imgBooldTest,
                    name: 'Blood Tests',
                    description: 'CBC, Health Packages',
                  ),
                  TestServices(
                    imagePath: AppImages.imgBooldTest,
                    name: 'Blood Tests',
                    description: 'CBC, Health Packages',
                  ),
                  TestServices(
                    imagePath: AppImages.imgBooldTest,
                    name: 'Blood Tests',
                    description: 'CBC, Health Packages',
                  ),
                ],
              ),
              CarouselBanner(),
              SizedBox(height: 16),
              HealthPackagesGrid(),
              SizedBox(height: 16),
              TopBookedPackagesListView(),
              SizedBox(height: 16),
              BookLabTestBanner(),
              SizedBox(height: 16),
              RoutineHealthCheckupListView(),
              SizedBox(height: 16),
              FamilyCarePackagesAutoPlayBanner(),
              SizedBox(height: 16),
              HolisticWomensCareGridView(),
              SizedBox(height: 16),
              DiagnosticImagingGridView(),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationMenu(
        initialIndex: _selectedTabIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
