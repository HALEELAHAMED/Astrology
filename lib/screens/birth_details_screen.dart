import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BirthDetailsScreen extends StatelessWidget {
  final dynamic astrologyData;

  const BirthDetailsScreen({super.key, required this.astrologyData});

  @override
  Widget build(BuildContext context) {
    // Get screen size and determine tablet size
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallTablet =
        screenSize.width >= 600 && screenSize.width < 900;
    final bool isLargeTablet = screenSize.width >= 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Enhanced App Bar
          SliverAppBar(
            expandedHeight: isLargeTablet ? 300.0 : 250.0,
            floating: false,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Jyotish Vidya',
                style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize:
                      isLargeTablet ? 30.0 : (isSmallTablet ? 26.0 : 20.0),
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF191970), Color(0xFF000046)],
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background stars pattern
                    Image.network(
                      'https://raw.githubusercontent.com/username/repo/master/assets/stars_pattern.png',
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Container(color: Colors.transparent),
                    ),
                    // Overlay gradient
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(0xFF000046).withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    // Content
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: isLargeTablet ? 80 : 60),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white30,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.auto_graph_rounded,
                              color: Colors.white70,
                              size: isLargeTablet ? 50 : 40,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Vedic Astrological Profile',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize:
                                  isLargeTablet
                                      ? 22.0
                                      : (isSmallTablet ? 18.0 : 16.0),
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: isLargeTablet ? 48.0 : (isSmallTablet ? 32.0 : 16.0),
              vertical: 24.0,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Two-column layout for tablets
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      flex: isLargeTablet ? 6 : 5,
                      child: Column(
                        children: [
                          NakshatraDetailsCard(
                            details: astrologyData['nakshatra_details'],
                            isSmallTablet: isSmallTablet,
                            isLargeTablet: isLargeTablet,
                          ),
                          const SizedBox(height: 24),
                          MangalDoshaCard(
                            dosha: astrologyData['mangal_dosha'],
                            isSmallTablet: isSmallTablet,
                            isLargeTablet: isLargeTablet,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isLargeTablet ? 32.0 : 24),
                    // Right column
                    Expanded(
                      flex: isLargeTablet ? 5 : 4,
                      child: Column(
                        children: [
                          YogaDetailsCard(
                            yogas: astrologyData['yoga_details'],
                            isSmallTablet: isSmallTablet,
                            isLargeTablet: isLargeTablet,
                          ),
                          const SizedBox(height: 24),
                          AdditionalInfoCard(
                            info:
                                astrologyData['nakshatra_details']['additional_info'],
                            isSmallTablet: isSmallTablet,
                            isLargeTablet: isLargeTablet,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Footer
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isLargeTablet ? 20 : 16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6A11CB).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.spa_outlined,
                          color: const Color(0xFF6A11CB),
                          size: isLargeTablet ? 36 : 28,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'ॐ सर्वे भवन्तु सुखिनः',
                        style: TextStyle(
                          fontSize:
                              isLargeTablet
                                  ? 22.0
                                  : (isSmallTablet ? 18.0 : 16.0),
                          color: const Color(0xFF6A11CB),
                          fontFamily: 'Cinzel',
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'May All Beings Be Happy',
                        style: TextStyle(
                          fontSize:
                              isLargeTablet
                                  ? 18.0
                                  : (isSmallTablet ? 16.0 : 14.0),
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanetIcon extends StatelessWidget {
  final String name;
  final double size;
  final Color color;

  const PlanetIcon({
    Key? key,
    required this.name,
    this.size = 32.0,
    this.color = const Color(0xFF6A11CB),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Planet symbols
    final icons = {
      'Jupiter': '♃',
      'Saturn': '♄',
      'Mars': '♂',
      'Sun': '☉',
      'Moon': '☽',
      'Venus': '♀',
      'Mercury': '☿',
      'Rahu': '☊',
      'Ketu': '☋',
    };

    return Container(
      width: size * 1.4,
      height: size * 1.4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
        ),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Text(
          icons[name] ?? '✧',
          style: TextStyle(fontSize: size, color: color, height: 1.1),
        ),
      ),
    );
  }
}

class NakshatraDetailsCard extends StatelessWidget {
  final Map<String, dynamic> details;
  final bool isSmallTablet;
  final bool isLargeTablet;

  const NakshatraDetailsCard({
    Key? key,
    required this.details,
    required this.isSmallTablet,
    required this.isLargeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nakshatra = details['nakshatra'] as Map<String, dynamic>;
    final chandraRasi = details['chandra_rasi'] as Map<String, dynamic>;
    final sooryaRasi = details['soorya_rasi'] as Map<String, dynamic>;
    final zodiac = details['zodiac'] as Map<String, dynamic>;
    final additionalInfo = details['additional_info'] as Map<String, dynamic>;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card Header
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 16.0),
              horizontal: isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 16.0),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.nights_stay_rounded,
                  color: Colors.white,
                  size: isLargeTablet ? 28 : 24,
                ),
                SizedBox(width: isLargeTablet ? 16 : 12),
                Text(
                  'Nakshatra Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        isLargeTablet ? 26.0 : (isSmallTablet ? 22.0 : 18.0),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Card Content
          Container(
            padding: EdgeInsets.all(
              isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              children: [
                // Nakshatra Main Info with decoration
                Container(
                  padding: EdgeInsets.all(
                    isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 20.0),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0FF),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6A11CB).withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        nakshatra['name'],
                        style: TextStyle(
                          fontSize:
                              isLargeTablet
                                  ? 36.0
                                  : (isSmallTablet ? 32.0 : 28.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel',
                          color: const Color(0xFF191970),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF191970).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          'Pada ${nakshatra['pada']}',
                          style: TextStyle(
                            fontSize: isLargeTablet ? 18.0 : 16.0,
                            color: const Color(0xFF191970),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 24.0),
                ),

                // Lord and Deity Row - Enhanced
                Container(
                  padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lord:',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 16 : 12),
                                Row(
                                  children: [
                                    PlanetIcon(
                                      name: nakshatra['lord']['name'],
                                      size:
                                          isLargeTablet
                                              ? 36.0
                                              : (isSmallTablet ? 32.0 : 28.0),
                                      color: const Color(0xFF6A11CB),
                                    ),
                                    SizedBox(width: isLargeTablet ? 16 : 12),
                                    Expanded(
                                      child: Text(
                                        '${nakshatra['lord']['name']} (${nakshatra['lord']['vedic_name']})',
                                        style: TextStyle(
                                          fontSize:
                                              isLargeTablet
                                                  ? 20.0
                                                  : (isSmallTablet
                                                      ? 18.0
                                                      : 16.0),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: isLargeTablet ? 28.0 : 24.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deity:',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 16 : 12),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          isLargeTablet
                                              ? 50.0
                                              : (isSmallTablet ? 45.0 : 40.0),
                                      height:
                                          isLargeTablet
                                              ? 50.0
                                              : (isSmallTablet ? 45.0 : 40.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFFF0F0FF),
                                        border: Border.all(
                                          color: const Color(
                                            0xFF6A11CB,
                                          ).withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.auto_awesome,
                                        color: const Color(0xFF6A11CB),
                                        size: isLargeTablet ? 28 : 24,
                                      ),
                                    ),
                                    SizedBox(width: isLargeTablet ? 16 : 12),
                                    Expanded(
                                      child: Text(
                                        additionalInfo['deity'],
                                        style: TextStyle(
                                          fontSize:
                                              isLargeTablet
                                                  ? 20.0
                                                  : (isSmallTablet
                                                      ? 18.0
                                                      : 16.0),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 20.0),
                ),

                // Moon and Sun Signs - Enhanced with icons
                Container(
                  padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Moon Sign Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: isLargeTablet ? 48.0 : 40.0,
                            height: isLargeTablet ? 48.0 : 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF0F8FF),
                              border: Border.all(
                                color: const Color(0xFF2575FC).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '☽',
                                style: TextStyle(
                                  fontSize: isLargeTablet ? 28.0 : 24.0,
                                  color: const Color(0xFF2575FC),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: isLargeTablet ? 20 : 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Moon Sign',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 8 : 4),
                                Text(
                                  chandraRasi['name'],
                                  style: TextStyle(
                                    fontSize:
                                        isLargeTablet
                                            ? 24.0
                                            : (isSmallTablet ? 20.0 : 18.0),
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: isLargeTablet ? 28.0 : 24.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Moon Lord:',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 8 : 4),
                                Row(
                                  children: [
                                    PlanetIcon(
                                      name: chandraRasi['lord']['name'],
                                      size: isLargeTablet ? 28.0 : 24.0,
                                      color: const Color(0xFF2575FC),
                                    ),
                                    SizedBox(width: isLargeTablet ? 12 : 8),
                                    Expanded(
                                      child: Text(
                                        '${chandraRasi['lord']['name']} (${chandraRasi['lord']['vedic_name']})',
                                        style: TextStyle(
                                          fontSize:
                                              isLargeTablet
                                                  ? 18.0
                                                  : (isSmallTablet
                                                      ? 16.0
                                                      : 14.0),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isLargeTablet ? 24 : 20),
                      // Sun Sign Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: isLargeTablet ? 48.0 : 40.0,
                            height: isLargeTablet ? 48.0 : 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFFF9F0),
                              border: Border.all(
                                color: const Color(0xFFFF9500).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '☉',
                                style: TextStyle(
                                  fontSize: isLargeTablet ? 28.0 : 24.0,
                                  color: const Color(0xFFFF9500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: isLargeTablet ? 20 : 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sun Sign',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 8 : 4),
                                Text(
                                  sooryaRasi['name'],
                                  style: TextStyle(
                                    fontSize:
                                        isLargeTablet
                                            ? 24.0
                                            : (isSmallTablet ? 20.0 : 18.0),
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: isLargeTablet ? 28.0 : 24.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sun Lord:',
                                  style: TextStyle(
                                    fontSize: isLargeTablet ? 16.0 : 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: isLargeTablet ? 8 : 4),
                                Row(
                                  children: [
                                    PlanetIcon(
                                      name: sooryaRasi['lord']['name'],
                                      size: isLargeTablet ? 28.0 : 24.0,
                                      color: const Color(0xFFFF9500),
                                    ),
                                    SizedBox(width: isLargeTablet ? 12 : 8),
                                    Expanded(
                                      child: Text(
                                        '${sooryaRasi['lord']['name']} (${sooryaRasi['lord']['vedic_name']})',
                                        style: TextStyle(
                                          fontSize:
                                              isLargeTablet
                                                  ? 18.0
                                                  : (isSmallTablet
                                                      ? 16.0
                                                      : 14.0),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 20.0),
                ),

                // Western Zodiac - Enhanced
                Container(
                  padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F9),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: isLargeTablet ? 48.0 : 40.0,
                        height: isLargeTablet ? 48.0 : 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF333333).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.public,
                          color: const Color(0xFF333333),
                          size: isLargeTablet ? 28 : 24,
                        ),
                      ),
                      SizedBox(width: isLargeTablet ? 20 : 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Western Zodiac',
                              style: TextStyle(
                                fontSize: isLargeTablet ? 16.0 : 14.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: isLargeTablet ? 8 : 4),
                            Text(
                              zodiac['name'],
                              style: TextStyle(
                                fontSize:
                                    isLargeTablet
                                        ? 24.0
                                        : (isSmallTablet ? 20.0 : 18.0),
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MangalDoshaCard extends StatelessWidget {
  final Map<String, dynamic> dosha;
  final bool isSmallTablet;
  final bool isLargeTablet;

  const MangalDoshaCard({
    Key? key,
    required this.dosha,
    required this.isSmallTablet,
    required this.isLargeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasDosha = dosha['has_dosha'] as bool;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card Header
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 16.0),
              horizontal: isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 16.0),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:
                    hasDosha
                        ? [const Color(0xFFFF3B30), const Color(0xFF990000)]
                        : [const Color(0xFF34C759), const Color(0xFF007D51)],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  hasDosha
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline,
                  color: Colors.white,
                  size: isLargeTablet ? 28 : 24,
                ),
                SizedBox(width: isLargeTablet ? 16 : 12),
                Text(
                  'Mangal Dosha',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        isLargeTablet ? 26.0 : (isSmallTablet ? 22.0 : 18.0),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Card Content
          Container(
            padding: EdgeInsets.all(
              isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 24.0),
            ),
            decoration: BoxDecoration(
              color: hasDosha ? const Color(0xFFFFF0EF) : Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 20.0),
                  ),
                  decoration: BoxDecoration(
                    color: hasDosha ? Colors.white : const Color(0xFFF0FFF0),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color:
                            hasDosha
                                ? const Color(0xFFFF3B30).withOpacity(0.1)
                                : const Color(0xFF34C759).withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        hasDosha ? Icons.report_problem : Icons.check_circle,
                        size:
                            isLargeTablet
                                ? 56.0
                                : (isSmallTablet ? 48.0 : 40.0),
                        color:
                            hasDosha
                                ? const Color(0xFFFF3B30)
                                : const Color(0xFF34C759),
                      ),
                      SizedBox(
                        height:
                            isLargeTablet
                                ? 20.0
                                : (isSmallTablet ? 16.0 : 12.0),
                      ),
                      Text(
                        dosha['description'] as String,
                        style: TextStyle(
                          fontSize:
                              isLargeTablet
                                  ? 22.0
                                  : (isSmallTablet ? 18.0 : 16.0),
                          color:
                              hasDosha
                                  ? const Color(0xFFFF3B30)
                                  : const Color(0xFF34C759),
                          height: 1.5,
                          fontWeight:
                              hasDosha ? FontWeight.w600 : FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                if (hasDosha) ...[
                  SizedBox(
                    height:
                        isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 20.0),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color(0xFFFF3B30),
                  //     foregroundColor: Colors.white,
                  //     padding: EdgeInsets.symmetric(
                  //       vertical:
                  //           isLargeTablet
                  //               ? 18.0
                  //               : (isSmallTablet ? 16.0 : 12.0),
                  //       horizontal:
                  //           isLargeTablet
                  //               ? 36.0
                  //               : (isSmallTablet ? 32.0 : 24.0),
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12.0),
                  //     ),
                  //     elevation: 0,
                  //     minimumSize: Size(
                  //       isLargeTablet ? 240.0 : (isSmallTablet ? 200.0 : 150.0),
                  //       0,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       const Icon(Icons.healing, size: 20),
                  //       SizedBox(width: isLargeTablet ? 12 : 8),
                  //       Text(
                  //         'View Remedies',
                  //         style: TextStyle(
                  //           fontSize:
                  //               isLargeTablet
                  //                   ? 18.0
                  //                   : (isSmallTablet ? 16.0 : 14.0),
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YogaDetailsCard extends StatelessWidget {
  final List<dynamic> yogas;
  final bool isSmallTablet;
  final bool isLargeTablet;

  const YogaDetailsCard({
    Key? key,
    required this.yogas,
    required this.isSmallTablet,
    required this.isLargeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card Header
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isLargeTablet ? 28.0 : (isSmallTablet ? 24.0 : 16.0),
              horizontal: isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 16.0),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF5856D6), Color(0xFF3634A3)],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.stars_rounded,
                  color: Colors.white,
                  size: isLargeTablet ? 28 : 24,
                ),
                SizedBox(width: isLargeTablet ? 16 : 12),
                Text(
                  'Yoga Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        isLargeTablet ? 26.0 : (isSmallTablet ? 22.0 : 18.0),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Card Content
          Container(
            padding: EdgeInsets.all(
              isLargeTablet ? 36.0 : (isSmallTablet ? 32.0 : 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...yogas.map((yoga) {
                  final yogaMap = yoga as Map<String, dynamic>;
                  final String name = yogaMap['name'];
                  final String description = yogaMap['description'];

                  // Custom icon based on yoga name
                  IconData yogaIcon;
                  Color yogaColor;
                  if (name.contains('Major')) {
                    yogaIcon = Icons.auto_awesome_rounded;
                    yogaColor = const Color(0xFF5856D6);
                  } else if (name.contains('Chandra')) {
                    yogaIcon = Icons.nightlight_round;
                    yogaColor = const Color(0xFF2575FC);
                  } else if (name.contains('Soorya')) {
                    yogaIcon = Icons.wb_sunny_rounded;
                    yogaColor = const Color(0xFFFF9500);
                  } else {
                    yogaIcon = Icons.warning_rounded;
                    yogaColor = const Color(0xFFFF3B30);
                  }

                  return Container(
                    margin: EdgeInsets.only(
                      bottom: isLargeTablet ? 20.0 : 16.0,
                    ),
                    padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
                    decoration: BoxDecoration(
                      color: yogaColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: yogaColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(isLargeTablet ? 10.0 : 8.0),
                          decoration: BoxDecoration(
                            color: yogaColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            yogaIcon,
                            color: yogaColor,
                            size: isLargeTablet ? 24.0 : 20.0,
                          ),
                        ),
                        SizedBox(width: isLargeTablet ? 20 : 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize:
                                      isLargeTablet
                                          ? 22.0
                                          : (isSmallTablet ? 18.0 : 16.0),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: isLargeTablet ? 8 : 4),
                              Text(
                                description,
                                style: TextStyle(
                                  fontSize:
                                      isLargeTablet
                                          ? 18.0
                                          : (isSmallTablet ? 16.0 : 14.0),
                                  color: Colors.black54,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                SizedBox(
                  height: isLargeTablet ? 20.0 : (isSmallTablet ? 16.0 : 12.0),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5856D6),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical:
                        isLargeTablet ? 18.0 : (isSmallTablet ? 16.0 : 12.0),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
     
    ],
  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdditionalInfoCard extends StatelessWidget {
  final Map<String, dynamic> info;
  final bool isSmallTablet;
  final bool isLargeTablet;

  const AdditionalInfoCard({
    Key? key,
    required this.info,
    required this.isSmallTablet,
    required this.isLargeTablet,
  }) : super(key: key);

  IconData _getIconForKey(String key) {
    switch (key.toLowerCase()) {
      case 'deity':
        return Icons.ac_unit;
      case 'ganam':
        return Icons.people_alt_outlined;
      case 'symbol':
        return Icons.emoji_symbols;
      case 'animal_sign':
        return Icons.pets;
      case 'nadi':
        return Icons.waves;
      case 'color':
        return Icons.color_lens;
      case 'best_direction':
        return Icons.explore;
      case 'syllables':
        return Icons.text_fields;
      case 'birth_stone':
        return Icons.diamond;
      case 'gender':
        return Icons.wc;
      case 'planet':
        return Icons.public;
      case 'enemy_yoni':
        return Icons.dangerous;
      default:
        return Icons.star;
    }
  }

  Widget _buildInfoItem(MapEntry<String, dynamic> entry, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(isLargeTablet ? 4.0 : 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9500).withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isLargeTablet ? 8.0 : 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: isLargeTablet ? 32.0 : 28.0,
              height: isLargeTablet ? 32.0 : 28.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFF0E0),
              ),
              child: Icon(
                _getIconForKey(entry.key),
                size: isLargeTablet ? 16.0 : 14.0,
                color: const Color(0xFFFF9500),
              ),
            ),
            SizedBox(width: isLargeTablet ? 8 : 6),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key
                        .replaceFirst(entry.key[0], entry.key[0].toUpperCase())
                        .replaceAll('_', ' '),
                    style: TextStyle(
                      fontSize: isLargeTablet ? 11.0 : 10.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    entry.value.toString(),
                    style: TextStyle(
                      fontSize: isLargeTablet ? 13.0 : 12.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create paired items for the grid
    final List<MapEntry<String, dynamic>> infoEntries = info.entries.toList();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card Header
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isLargeTablet ? 20.0 : (isSmallTablet ? 18.0 : 14.0),
              horizontal: isLargeTablet ? 24.0 : (isSmallTablet ? 20.0 : 16.0),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF9500), Color(0xFFFF5E3A)],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: isLargeTablet ? 22 : 18,
                ),
                SizedBox(width: isLargeTablet ? 12 : 8),
                Flexible(
                  child: Text(
                    'Additional Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          isLargeTablet ? 18.0 : (isSmallTablet ? 16.0 : 14.0),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Card Content
          Padding(
            padding: EdgeInsets.all(
              isLargeTablet ? 16.0 : (isSmallTablet ? 12.0 : 8.0),
            ),
            child: Column(
              children: [
                // Grid View with dynamic sizing
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double availableWidth = constraints.maxWidth;
                    final int crossAxisCount =
                        availableWidth > 700
                            ? 4
                            : availableWidth > 500
                            ? 3
                            : 2;

                    final double childAspectRatio =
                        availableWidth > 700
                            ? 2.2
                            : availableWidth > 500
                            ? 1.8
                            : 1.5;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: isLargeTablet ? 12.0 : 8.0,
                        mainAxisSpacing: isLargeTablet ? 12.0 : 8.0,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemCount: infoEntries.length,
                      itemBuilder: (context, index) {
                        final entry = infoEntries[index];
                        return _buildInfoItem(entry, context);
                      },
                    );
                  },
                ),

                // Download Button
                // Padding(
                //   padding: EdgeInsets.only(top: isLargeTablet ? 16.0 : 12.0),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: TextButton.icon(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.download_rounded,
                //         size: isLargeTablet ? 18 : 16,
                //       ),
                //       label: Text(
                //         'Download Report',
                //         style: TextStyle(
                //           fontSize: isLargeTablet ? 15.0 : 13.0,
                //         ),
                //       ),
                //       style: TextButton.styleFrom(
                //         foregroundColor: const Color(0xFFFF9500),
                //         padding: EdgeInsets.symmetric(
                //           vertical: isLargeTablet ? 12.0 : 10.0,
                //           horizontal: 16.0,
                //         ),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8.0),
                //           side: const BorderSide(color: Color(0xFFFF9500)),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
