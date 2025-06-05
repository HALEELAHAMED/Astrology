import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MatchResultScreen extends StatelessWidget {
  final String girlName;
  final String boyName;
   final Map<String, dynamic> matchData;

  const MatchResultScreen({
    Key? key,
    required this.girlName,
    required this.boyName,
    required this.matchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallTablet = MediaQuery.of(context).size.width >= 600 && 
        MediaQuery.of(context).size.width < 900;
    final bool isLargeTablet = MediaQuery.of(context).size.width >= 900;

    // Extract data from API response
    final girlInfo = matchData['girl_info'] ?? {};
    final boyInfo = matchData['boy_info'] ?? {};
    final message = matchData['message'] ?? {};
    final gunaMilan = matchData['guna_milan'] ?? {};
    // final totalPoints = gunaMilan['total_points'] ?? 0;
    final totalPoints = (gunaMilan['total_points'] as num?)?.toInt() ?? 0;
    // final maxPoints = gunaMilan['maximum_points'] ?? 36;
    final maxPoints = (gunaMilan['maximum_points'] as num?)?.toInt() ?? 36;
    final percentage = (totalPoints / maxPoints * 100).toStringAsFixed(1);
    final gunaDetails = (gunaMilan['guna'] as List<dynamic>?) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Compatibility Result',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isLargeTablet ? 32.0 : (isSmallTablet ? 24.0 : 16.0),
          vertical: isLargeTablet ? 32.0 : 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MatchSummaryCard(
              isSmallTablet: isSmallTablet,
              isLargeTablet: isLargeTablet,
              boyName: boyName,
              girlName: girlName,
              percentage: percentage,
              message: message['description'] ?? '',
              isCompatible: double.parse(percentage) > 50,
            ),
            SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            PartnerDetailsCards(
              isSmallTablet: isSmallTablet,
              isLargeTablet: isLargeTablet,
              girlInfo: girlInfo,
              boyInfo: boyInfo,
            ),
            SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            GunaScoreCard(
              isSmallTablet: isSmallTablet,
              isLargeTablet: isLargeTablet,
              totalPoints: totalPoints,
              maxPoints: maxPoints,
              percentage: percentage,
            ),
            SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            if (gunaDetails.isNotEmpty)
              DetailedGunaAnalysis(
                isSmallTablet: isSmallTablet,
                isLargeTablet: isLargeTablet,
                gunaDetails: gunaDetails,
              ),
            if (gunaDetails.isNotEmpty)
              SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            DoshaAnalysisCard(
              isSmallTablet: isSmallTablet,
              isLargeTablet: isLargeTablet,
              girlInfo: girlInfo,
              boyInfo: boyInfo,
              message: message['description'] ?? '',
            ),
            SizedBox(height: isLargeTablet ? 40.0 : 30.0),
            SizedBox(height: isLargeTablet ? 48.0 : 40.0),
          ],
        ),
      ),
    );
  }
}

class MatchSummaryCard extends StatelessWidget {
  final bool isSmallTablet;
  final bool isLargeTablet;
  final String boyName;
  final String girlName;
  final String percentage;
  final String message;
  final bool isCompatible;

  const MatchSummaryCard({
    Key? key,
    required this.isSmallTablet,
    required this.isLargeTablet,
    required this.boyName,
    required this.girlName,
    required this.percentage,
    required this.message,
    required this.isCompatible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(isLargeTablet ? 32.0 : (isSmallTablet ? 24.0 : 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isCompatible 
              ? [const Color(0xFF6C4AB6), const Color(0xFF8D72E1)]
              : [const Color(0xFFD32F2F), const Color(0xFFF44336)],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileCircle(
                  name: boyName,
                  size: isLargeTablet ? 100.0 : (isSmallTablet ? 90.0 : 80.0),
                ),
                SizedBox(width: isLargeTablet ? 32.0 : 20.0),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: isLargeTablet ? 48.0 : 36.0,
                ),
                SizedBox(width: isLargeTablet ? 32.0 : 20.0),
                ProfileCircle(
                  name: girlName,
                  size: isLargeTablet ? 100.0 : (isSmallTablet ? 90.0 : 80.0),
                ),
              ],
            ),
            SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            CircularPercentIndicator(
              radius: isLargeTablet ? 100.0 : (isSmallTablet ? 90.0 : 75.0),
              lineWidth: isLargeTablet ? 18.0 : 15.0,
              percent: double.parse(percentage) / 100,
              center: Text(
                "$percentage%",
                style: TextStyle(
                  fontSize: isLargeTablet ? 36.0 : 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.white,
              backgroundColor: Colors.white30,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: isLargeTablet ? 32.0 : 24.0),
            Text(
              isCompatible ? 'Compatible Union' : 'Incompatible Union',
              style: TextStyle(
                fontSize: isLargeTablet ? 28.0 : 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: isLargeTablet ? 16.0 : 12.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isLargeTablet ? 18.0 : 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCircle extends StatelessWidget {
  final String name;
  final double size;

  const ProfileCircle({
    Key? key,
    required this.name,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6C4AB6),
          ),
        ),
      ),
    );
  }
}

class PartnerDetailsCards extends StatelessWidget {
  final bool isSmallTablet;
  final bool isLargeTablet;
  final Map<String, dynamic> girlInfo;
  final Map<String, dynamic> boyInfo;

  const PartnerDetailsCards({
    Key? key,
    required this.isSmallTablet,
    required this.isLargeTablet,
    required this.girlInfo,
    required this.boyInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPartnerCard(
            context,
            'Male',
            boyInfo,
            Icons.male,
            const Color(0xFF4E6BBF),
          ),
        ),
        SizedBox(width: isLargeTablet ? 24.0 : 16.0),
        Expanded(
          child: _buildPartnerCard(
            context,
            'Female',
            girlInfo,
            Icons.female,
            const Color(0xFFE57373),
          ),
        ),
      ],
    );
  }

  Widget _buildPartnerCard(
    BuildContext context,
    String title,
    Map<String, dynamic> info,
    IconData icon,
    Color color,
  ) {
    final koot = info['koot'] ?? {};
    final nakshatra = info['nakshatra'] ?? {};
    final rasi = info['rasi'] ?? {};

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(isLargeTablet ? 24.0 : (isSmallTablet ? 20.0 : 16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isLargeTablet ? 12.0 : 8.0),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: isLargeTablet ? 24.0 : 20.0,
                  ),
                ),
                SizedBox(width: isLargeTablet ? 12.0 : 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isLargeTablet ? 20.0 : 16.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: isLargeTablet ? 20.0 : 16.0),
            _buildDetailRow('Rashi:', rasi['name'] ?? 'N/A'),
            SizedBox(height: isLargeTablet ? 12.0 : 8.0),
            _buildDetailRow('Nakshatra:', nakshatra['name'] ?? 'N/A'),
            SizedBox(height: isLargeTablet ? 12.0 : 8.0),
            _buildDetailRow('Pada:', 'Pada ${nakshatra['pada'] ?? 'N/A'}'),
            SizedBox(height: isLargeTablet ? 12.0 : 8.0),
            _buildDetailRow('Varna:', koot['varna'] ?? 'N/A'),
            SizedBox(height: isLargeTablet ? 12.0 : 8.0),
            _buildDetailRow('Gana:', koot['gana'] ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isLargeTablet ? 16.0 : 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isLargeTablet ? 16.0 : 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class GunaScoreCard extends StatelessWidget {
  final bool isSmallTablet;
  final bool isLargeTablet;
  final int totalPoints;
  final int maxPoints;
  final String percentage;

  const GunaScoreCard({
    Key? key,
    required this.isSmallTablet,
    required this.isLargeTablet,
    required this.totalPoints,
    required this.maxPoints,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(isLargeTablet ? 28.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guna Milan Score',
              style: TextStyle(
                fontSize: isLargeTablet ? 22.0 : 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isLargeTablet ? 28.0 : 20.0),
            LinearPercentIndicator(
              lineHeight: isLargeTablet ? 20.0 : 16.0,
              percent: totalPoints / maxPoints,
              center: Text(
                "$totalPoints/$maxPoints",
                style: TextStyle(
                  fontSize: isLargeTablet ? 14.0 : 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              barRadius: const Radius.circular(8),
              backgroundColor: Colors.grey.shade200,
              progressColor: const Color(0xFF6C4AB6),
            ),
            SizedBox(height: isLargeTablet ? 24.0 : 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildScoreBox(
                  totalPoints.toString(),
                  'Points\nObtained',
                  Colors.green.shade400,
                  isLargeTablet,
                ),
                _buildScoreBox(
                  maxPoints.toString(),
                  'Maximum\nPoints',
                  Colors.blue.shade400,
                  isLargeTablet,
                ),
                _buildScoreBox(
                  '$percentage%',
                  'Compatibility\nPercentage',
                  Colors.purple.shade400,
                  isLargeTablet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBox(String score, String label, Color color, bool isLargeTablet) {
    return Container(
      width: isLargeTablet ? 120.0 : 100.0,
      padding: EdgeInsets.all(isLargeTablet ? 16.0 : 10.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            score,
            style: TextStyle(
              fontSize: isLargeTablet ? 24.0 : 20.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: isLargeTablet ? 8.0 : 4.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isLargeTablet ? 14.0 : 12.0,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailedGunaAnalysis extends StatelessWidget {
  final bool isSmallTablet;
  final bool isLargeTablet;
  final List<dynamic> gunaDetails;

  const DetailedGunaAnalysis({
    Key? key,
    required this.isSmallTablet,
    required this.isLargeTablet,
    required this.gunaDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(isLargeTablet ? 28.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detailed Guna Analysis',
              style: TextStyle(
                fontSize: isLargeTablet ? 22.0 : 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isLargeTablet ? 24.0 : 16.0),
            ...gunaDetails.map((guna) {
              return GunaDetailItem(
                name: guna['name'] ?? 'N/A',
                value: '${guna['boy_koot'] ?? 'N/A'}-${guna['girl_koot'] ?? 'N/A'}',
                obtained: guna['points_obtained'] ?? 0,
                maximum: guna['maximum_points'] ?? 0,
                rating: _getRating(guna['points_obtained'], guna['maximum_points']),
                description: guna['description'] ?? 'No description available',
                isLargeTablet: isLargeTablet,
                isLast: guna == gunaDetails.last,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  String _getRating(int? obtained, int? maximum) {
    if (obtained == null || maximum == null || maximum == 0) return 'Unknown';
    final ratio = obtained / maximum;
    if (ratio >= 0.8) return 'Excellent';
    if (ratio >= 0.5) return 'Good';
    if (ratio > 0) return 'Average';
    return 'Poor';
  }
}

class GunaDetailItem extends StatefulWidget {
  final String name;
  final String value;
  final int obtained;
  final int maximum;
  final String rating;
  final String description;
  final bool isLast;
  final bool isLargeTablet;

  const GunaDetailItem({
    Key? key,
    required this.name,
    required this.value,
    required this.obtained,
    required this.maximum,
    required this.rating,
    required this.description,
    this.isLast = false,
    required this.isLargeTablet,
  }) : super(key: key);

  @override
  State<GunaDetailItem> createState() => _GunaDetailItemState();
}

class _GunaDetailItemState extends State<GunaDetailItem> {
  bool _expanded = false;

  Color _getStatusColor() {
    switch (widget.rating) {
      case 'Excellent':
        return Colors.green;
      case 'Good':
        return Colors.lightGreen;
      case 'Average':
        return Colors.orange;
      case 'Poor':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: widget.isLargeTablet ? 12.0 : 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: widget.isLargeTablet ? 20.0 : 16.0,
                            ),
                          ),
                          SizedBox(width: widget.isLargeTablet ? 12.0 : 8.0),
                          Icon(
                            _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: widget.isLargeTablet ? 24.0 : 20.0,
                          ),
                        ],
                      ),
                      SizedBox(height: widget.isLargeTablet ? 8.0 : 4.0),
                      Text(
                        widget.value,
                        style: TextStyle(
                          fontSize: widget.isLargeTablet ? 16.0 : 14.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.obtained}/${widget.maximum}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.isLargeTablet ? 20.0 : 16.0,
                      ),
                    ),
                    SizedBox(height: widget.isLargeTablet ? 8.0 : 4.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.isLargeTablet ? 14.0 : 10.0,
                        vertical: widget.isLargeTablet ? 6.0 : 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.rating,
                        style: TextStyle(
                          color: _getStatusColor(),
                          fontSize: widget.isLargeTablet ? 14.0 : 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (_expanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(
              top: widget.isLargeTablet ? 12.0 : 8.0,
              bottom: widget.isLargeTablet ? 16.0 : 12.0,
            ),
            padding: EdgeInsets.all(widget.isLargeTablet ? 20.0 : 16.0),
            decoration: BoxDecoration(
              color: _getStatusColor().withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _getStatusColor().withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: widget.isLargeTablet ? 16.0 : 14.0,
                  ),
                ),
                SizedBox(height: widget.isLargeTablet ? 12.0 : 8.0),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: widget.isLargeTablet ? 16.0 : 14.0,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        if (!widget.isLast)
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.isLargeTablet ? 16.0 : 12.0),
            child: const Divider(height: 1),
          ),
      ],
    );
  }
}

class DoshaAnalysisCard extends StatelessWidget {
  final bool isSmallTablet;
  final bool isLargeTablet;
  final Map<String, dynamic> girlInfo;
  final Map<String, dynamic> boyInfo;
  final String message;

  const DoshaAnalysisCard({
    Key? key,
    required this.isSmallTablet,
    required this.isLargeTablet,
    required this.girlInfo,
    required this.boyInfo,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool girlHasDosha = girlInfo['has_mangal_dosha'] ?? false;
    final bool boyHasDosha = boyInfo['has_mangal_dosha'] ?? false;
    final bool hasNadiDosha = message.toLowerCase().contains('nadi');

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(isLargeTablet ? 28.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dosha Analysis',
              style: TextStyle(
                fontSize: isLargeTablet ? 22.0 : 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isLargeTablet ? 28.0 : 20.0),
            
            if (hasNadiDosha) 
              _buildCriticalDoshaWarning(
                'Nadi Maha Dosha Detected! This is a serious compatibility issue that needs consideration.',
                Colors.red,
              ),
            
            Row(
              children: [
                Expanded(
                  child: _buildDoshaCard(
                    'Female',
                    girlHasDosha,
                    girlHasDosha ? 'Present' : 'Absent',
                    girlHasDosha 
                      ? 'Manglik Dosha detected. May require remedies.' 
                      : 'No Manglik Dosha detected',
                    Icons.female,
                    const Color(0xFFE57373),
                  ),
                ),
                SizedBox(width: isLargeTablet ? 24.0 : 16.0),
                Expanded(
                  child: _buildDoshaCard(
                    'Male',
                    boyHasDosha,
                    boyHasDosha ? 'Present' : 'Absent',
                    boyHasDosha 
                      ? 'Manglik Dosha detected. May require remedies.' 
                      : 'No Manglik Dosha detected',
                    Icons.male,
                    const Color(0xFF4E6BBF),
                  ),
                ),
              ],
            ),
            SizedBox(height: isLargeTablet ? 24.0 : 16.0),
            Container(
              padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
              decoration: BoxDecoration(
                color: hasNadiDosha ? Colors.red.shade50 : Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: hasNadiDosha ? Colors.red.shade200 : Colors.amber.shade200,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    hasNadiDosha ? Icons.warning : Icons.info,
                    color: hasNadiDosha ? Colors.red : Colors.amber.shade800,
                    size: isLargeTablet ? 28.0 : 24.0,
                  ),
                  SizedBox(width: isLargeTablet ? 16.0 : 12.0),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: isLargeTablet ? 16.0 : 14.0,
                        color: hasNadiDosha ? Colors.red.shade900 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCriticalDoshaWarning(String text, Color color) {
    return Container(
      padding: EdgeInsets.all(isLargeTablet ? 16.0 : 12.0),
      margin: EdgeInsets.only(bottom: isLargeTablet ? 20.0 : 16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning, color: color),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: isLargeTablet ? 16.0 : 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoshaCard(
    String title,
    bool hasDosha,
    String doshaStatus,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(isLargeTablet ? 20.0 : 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(isLargeTablet ? 12.0 : 8.0),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: isLargeTablet ? 24.0 : 20.0,
                ),
              ),
              SizedBox(width: isLargeTablet ? 12.0 : 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: isLargeTablet ? 20.0 : 16.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: isLargeTablet ? 16.0 : 12.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeTablet ? 14.0 : 10.0,
                  vertical: isLargeTablet ? 6.0 : 4.0,
                ),
                decoration: BoxDecoration(
                  color: hasDosha
                      ? const Color(0xFFFFCDD2)
                      : const Color(0xFFDCEDC8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  hasDosha ? 'Manglik' : 'Non-Manglik',
                  style: TextStyle(
                    color: hasDosha
                        ? const Color(0xFFD32F2F)
                        : const Color(0xFF388E3C),
                    fontSize: isLargeTablet ? 14.0 : 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: isLargeTablet ? 8.0 : 6.0),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeTablet ? 14.0 : 10.0,
                  vertical: isLargeTablet ? 6.0 : 4.0,
                ),
                decoration: BoxDecoration(
                  color: hasDosha
                      ? const Color(0xFFFFE0B2)
                      : const Color(0xFFC8E6C9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  doshaStatus,
                  style: TextStyle(
                    color: hasDosha
                        ? const Color(0xFFE65100)
                        : const Color(0xFF2E7D32),
                    fontSize: isLargeTablet ? 14.0 : 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isLargeTablet ? 16.0 : 12.0),
          Text(
            description,
            style: TextStyle(
              fontSize: isLargeTablet ? 16.0 : 14.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}