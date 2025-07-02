import 'package:flutter/material.dart';
import '../../models/beacon_division.dart';
import '../jobs/job_detail_screen.dart';
import '../donations/donation_screen.dart';

class DivisionDetailScreen extends StatefulWidget {
  final BeaconDivision division;

  const DivisionDetailScreen({Key? key, required this.division}) : super(key: key);

  @override
  _DivisionDetailScreenState createState() => _DivisionDetailScreenState();
}

class _DivisionDetailScreenState extends State<DivisionDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(int.parse(widget.division.color.replaceFirst('#', '0xFF')));
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(primaryColor),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildHeaderInfo(primaryColor),
                _buildTabSection(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActions(primaryColor),
    );
  }

  Widget _buildSliverAppBar(Color primaryColor) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.division.shortName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                primaryColor.withAlpha(180),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(51),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.division.icon,
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.white),
          onPressed: () {
            // Handle share
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {
            // Handle favorite
          },
        ),
      ],
    );
  }

  Widget _buildHeaderInfo(Color primaryColor) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha(26),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.division.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              _buildStatusBadge(),
            ],
          ),
          SizedBox(height: 12),
          Text(
            widget.division.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(
                '${widget.division.capacity}% Available',
                Icons.assessment,
                widget.division.capacity > 80 ? Colors.green : Colors.orange,
              ),
              SizedBox(width: 12),
              _buildInfoChip(
                '${widget.division.jobOpenings.length} Jobs',
                Icons.work,
                Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: widget.division.isAvailable ? Colors.green[100] : Colors.orange[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.division.isAvailable ? Icons.check_circle : Icons.access_time,
            color: widget.division.isAvailable ? Colors.green[700] : Colors.orange[700],
            size: 16,
          ),
          SizedBox(width: 4),
          Text(
            widget.division.isAvailable ? 'Available' : 'Limited',
            style: TextStyle(
              color: widget.division.isAvailable ? Colors.green[700] : Colors.orange[700],
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))),
            unselectedLabelColor: Colors.grey[600],
            indicatorColor: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))),
            tabs: [
              Tab(text: 'Services'),
              Tab(text: 'Resources'),
              Tab(text: 'Jobs'),
              Tab(text: 'Donate'),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildServicesTab(),
                _buildResourcesTab(),
                _buildJobsTab(),
                _buildDonateTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesTab() {
    return ListView.builder(
      itemCount: widget.division.services.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))).withAlpha(51),
              child: Icon(
                Icons.medical_services,
                color: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))),
              ),
            ),
            title: Text(
              widget.division.services[index],
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Available 24/7 with qualified staff'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showServiceDetails(widget.division.services[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildResourcesTab() {
    return ListView.builder(
      itemCount: widget.division.resources.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.folder_open, color: Colors.blue[700]),
            ),
            title: Text(
              widget.division.resources[index],
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Immediate access available'),
            trailing: Icon(Icons.download, size: 16),
            onTap: () {
              _showResourceDetails(widget.division.resources[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildJobsTab() {
    if (widget.division.jobOpenings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.work_off, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              'No job openings available',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Check back later for new opportunities',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.division.jobOpenings.length,
      itemBuilder: (context, index) {
        JobOpportunity job = widget.division.jobOpenings[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: job),
                ),
              );
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          job.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (job.isUrgent)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'URGENT',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[700],
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    job.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      _buildJobInfoChip(job.type.toUpperCase(), Icons.schedule),
                      SizedBox(width: 8),
                      _buildJobInfoChip(job.location, Icons.location_on),
                      if (job.isRemote) ...[
                        SizedBox(width: 8),
                        _buildJobInfoChip('REMOTE', Icons.home),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildJobInfoChip(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.grey[600]),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonateTab() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support ${widget.division.shortName}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Your donation directly supports our ${widget.division.shortName.toLowerCase()} services, helping us provide essential support to those in need.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          SizedBox(height: 24),
          _buildDonationOptions(),
        ],
      ),
    );
  }

  Widget _buildDonationOptions() {
    List<Map<String, dynamic>> donationAmounts = [
      {'amount': 25, 'description': 'Provides basic supplies for one person'},
      {'amount': 50, 'description': 'Supports counseling session'},
      {'amount': 100, 'description': 'Helps with emergency assistance'},
      {'amount': 250, 'description': 'Sponsors training program'},
    ];

    return Column(
      children: donationAmounts.map((donation) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationScreen(
                      division: widget.division,
                      suggestedAmount: donation['amount'],
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))).withAlpha(51),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '₵${donation['amount']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(int.parse(widget.division.color.replaceFirst('#', '0xFF'))),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        donation['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFloatingActions(Color primaryColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "contact",
          onPressed: () {
            _showContactOptions();
          },
          backgroundColor: primaryColor,
          child: Icon(Icons.phone, color: Colors.white),
        ),
        SizedBox(height: 16),
        FloatingActionButton.extended(
          heroTag: "emergency",
          onPressed: () {
            Navigator.pushNamed(context, '/emergency');
          },
          backgroundColor: Colors.red[600],
          icon: Icon(Icons.emergency, color: Colors.white),
          label: Text(
            'Emergency',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showServiceDetails(String service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(service),
        content: Text('Detailed information about $service would be displayed here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle service request
            },
            child: Text('Request Service'),
          ),
        ],
      ),
    );
  }

  void _showResourceDetails(String resource) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(resource),
        content: Text('Information about $resource and how to access it.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle resource access
            },
            child: Text('Access Resource'),
          ),
        ],
      ),
    );
  }

  void _showContactOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Contact ${widget.division.shortName}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone, color: Color(0xFF2E8B57)),
              title: Text('Call'),
              subtitle: Text(widget.division.contactPhone),
              onTap: () {
                Navigator.pop(context);
                // Handle phone call
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: Color(0xFF2E8B57)),
              title: Text('Email'),
              subtitle: Text(widget.division.contactEmail),
              onTap: () {
                Navigator.pop(context);
                // Handle email
              },
            ),
            ListTile(
              leading: Icon(Icons.message, color: Color(0xFF2E8B57)),
              title: Text('Message'),
              subtitle: Text('Send secure message'),
              onTap: () {
                Navigator.pop(context);
                // Handle messaging
              },
            ),
          ],
        ),
      ),
    );
  }
}