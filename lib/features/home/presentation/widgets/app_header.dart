import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      height: 200,
      // Make header taller and include safe area padding
      padding: EdgeInsets.fromLTRB(16, 12 + topPadding, 16, 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff074848), Color(0xff1E8281)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: location + actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.place, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Namaste Ujjwal',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notifications - no new items')),
                      );
                    },
                    icon: const Icon(Icons.notifications_none, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Messages - coming soon')),
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile clicked')),
                      );
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text('JD', style: TextStyle(color: Color(0xff0F6A6C), fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Search box integrated in header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xff0F6A6C)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search for "X-Ray"',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: (v) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Search: $v')),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Voice search coming soon')),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.mic, color: Color(0xff0F6A6C)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              'HealthCare It',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

