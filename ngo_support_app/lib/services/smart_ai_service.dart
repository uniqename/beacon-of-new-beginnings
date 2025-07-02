import '../models/beacon_division.dart';
import '../models/resource.dart';
import '../models/case.dart';

class SmartAIService {
  // AI-powered resource routing system
  static List<BeaconDivision> smartResourceRouting({
    required String helpType,
    required String urgency,
    required String location,
    String? description,
  }) {
    List<BeaconDivision> allDivisions = _getAllBeaconDivisions();
    List<BeaconDivision> prioritizedDivisions = [];

    // AI Logic: Prioritize Beacon divisions first, then external options
    switch (helpType.toLowerCase()) {
      case 'emergency':
      case 'shelter':
        prioritizedDivisions = _prioritizeForShelter(allDivisions, urgency);
        break;
      case 'legal':
        prioritizedDivisions = _prioritizeForLegal(allDivisions, urgency);
        break;
      case 'counseling':
      case 'therapy':
        prioritizedDivisions = _prioritizeForCounseling(allDivisions, urgency);
        break;
      case 'healthcare':
      case 'medical':
        prioritizedDivisions = _prioritizeForHealthcare(allDivisions, urgency);
        break;
      case 'job-training':
      case 'employment':
        prioritizedDivisions = _prioritizeForJobTraining(allDivisions, urgency);
        break;
      case 'education':
        prioritizedDivisions = _prioritizeForEducation(allDivisions, urgency);
        break;
      case 'financial':
        prioritizedDivisions = _prioritizeForFinancial(allDivisions, urgency);
        break;
      case 'food':
      case 'clothing':
        prioritizedDivisions = _prioritizeForBasicNeeds(allDivisions, urgency);
        break;
      default:
        prioritizedDivisions = _prioritizeGeneral(allDivisions, urgency);
    }

    return prioritizedDivisions;
  }

  static List<BeaconDivision> _getAllBeaconDivisions() {
    return [
      BeaconDivision(
        id: 'beacon_shelter',
        name: 'BeaconGH Shelter Services',
        shortName: 'BeaconGH Shelter',
        description: 'Safe, secure emergency and transitional housing with 24/7 support staff',
        icon: '🏠',
        color: '#2E8B57',
        services: [
          'Emergency shelter placement',
          'Transitional housing',
          'Safety planning',
          'Children accommodation',
          '24/7 security'
        ],
        resources: [
          'Immediate bed availability',
          'Crisis intervention',
          'Case management',
          'Support groups'
        ],
        isAvailable: true,
        capacity: 85,
        contactEmail: 'shelter@beacongh.org',
        contactPhone: '+233501234567',
        donationUrl: 'https://beaconnewbeginnings.org/donate/shelter',
        jobOpenings: [
          JobOpportunity(
            id: 'shelter_coord_001',
            title: 'Shelter Coordinator',
            type: 'full-time',
            description: 'Manage daily shelter operations and client intake',
            requirements: [
              'Bachelor\'s degree in Social Work',
              'Experience with trauma survivors',
              'Crisis intervention training'
            ],
            location: 'Accra, Ghana',
            isRemote: false,
            applicationEmail: 'jobs.shelter@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 3)),
            isUrgent: true,
          ),
          JobOpportunity(
            id: 'shelter_vol_001',
            title: 'Overnight Volunteer',
            type: 'volunteer',
            description: 'Provide overnight support and safety monitoring',
            requirements: [
              'Background check required',
              'Trauma-informed care training',
              'Commitment to 2 nights per month'
            ],
            location: 'Multiple locations in Accra',
            isRemote: false,
            applicationEmail: 'volunteer.shelter@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 1)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_legal',
        name: 'BeaconGH Legal Assistance',
        shortName: 'BeaconGH Legal',
        description: 'Comprehensive legal advocacy and representation for survivors',
        icon: '⚖️',
        color: '#1B5E42',
        services: [
          'Legal representation',
          'Court accompaniment',
          'Protective orders',
          'Family law assistance',
          'Immigration support'
        ],
        resources: [
          'Pro bono lawyers',
          'Legal aid application',
          'Court documentation',
          'Rights education'
        ],
        isAvailable: true,
        capacity: 92,
        contactEmail: 'legal@beacongh.org',
        contactPhone: '+233501234568',
        donationUrl: 'https://beaconnewbeginnings.org/donate/legal',
        jobOpenings: [
          JobOpportunity(
            id: 'legal_adv_001',
            title: 'Legal Advocate',
            type: 'part-time',
            description: 'Provide legal advocacy and court support for survivors',
            requirements: [
              'Law degree or paralegal certification',
              'Experience with domestic violence cases',
              'Fluency in English and local languages'
            ],
            location: 'Accra and Kumasi',
            isRemote: false,
            applicationEmail: 'jobs.legal@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 5)),
            isUrgent: true,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_counseling',
        name: 'BeaconGH Counseling Services',
        shortName: 'BeaconGH Counseling',
        description: 'Trauma-informed therapy and mental health support',
        icon: '💬',
        color: '#4CAF50',
        services: [
          'Individual therapy',
          'Group counseling',
          'Family therapy',
          'Trauma counseling',
          'Crisis intervention'
        ],
        resources: [
          'Licensed therapists',
          'Support groups',
          'Mental health workshops',
          'Peer counseling'
        ],
        isAvailable: true,
        capacity: 78,
        contactEmail: 'counseling@beacongh.org',
        contactPhone: '+233501234569',
        donationUrl: 'https://beaconnewbeginnings.org/donate/counseling',
        jobOpenings: [
          JobOpportunity(
            id: 'counselor_001',
            title: 'Licensed Clinical Counselor',
            type: 'full-time',
            description: 'Provide trauma-informed therapy for abuse survivors',
            requirements: [
              'Master\'s in Clinical Psychology',
              'Licensed counselor in Ghana',
              'Trauma therapy certification'
            ],
            location: 'Accra',
            isRemote: false,
            applicationEmail: 'jobs.counseling@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 7)),
            isUrgent: true,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_groups',
        name: 'BeaconGH Support Groups',
        shortName: 'BeaconGH Groups',
        description: 'Peer support and community healing circles',
        icon: '👥',
        color: '#FFA726',
        services: [
          'Survivor support circles',
          'Peer mentoring',
          'Skills workshops',
          'Community events',
          'Healing retreats'
        ],
        resources: [
          'Weekly group meetings',
          'Peer support network',
          'Online forums',
          'Resource sharing'
        ],
        isAvailable: true,
        capacity: 95,
        contactEmail: 'groups@beacongh.org',
        contactPhone: '+233501234570',
        donationUrl: 'https://beaconnewbeginnings.org/donate/groups',
        jobOpenings: [
          JobOpportunity(
            id: 'group_facil_001',
            title: 'Support Group Facilitator',
            type: 'part-time',
            description: 'Lead peer support groups and healing circles',
            requirements: [
              'Group facilitation experience',
              'Trauma-informed care training',
              'Strong communication skills'
            ],
            location: 'Various locations in Greater Accra',
            isRemote: false,
            applicationEmail: 'jobs.groups@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 2)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_healthcare',
        name: 'BeaconGH Healthcare Support',
        shortName: 'BeaconGH Healthcare',
        description: 'Medical care coordination and health advocacy',
        icon: '🏥',
        color: '#64B5F6',
        services: [
          'Medical referrals',
          'Health insurance assistance',
          'Mental health medication',
          'Emergency medical care',
          'Health education'
        ],
        resources: [
          'Partner clinics',
          'Mobile health units',
          'Prescription assistance',
          'Health screenings'
        ],
        isAvailable: true,
        capacity: 88,
        contactEmail: 'healthcare@beacongh.org',
        contactPhone: '+233501234571',
        donationUrl: 'https://beaconnewbeginnings.org/donate/healthcare',
        jobOpenings: [
          JobOpportunity(
            id: 'health_coord_001',
            title: 'Health Services Coordinator',
            type: 'full-time',
            description: 'Coordinate medical services and health advocacy',
            requirements: [
              'Public health or nursing background',
              'Healthcare system knowledge',
              'Case management experience'
            ],
            location: 'Accra',
            isRemote: false,
            applicationEmail: 'jobs.healthcare@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 4)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_job_training',
        name: 'BeaconGH Job Training',
        shortName: 'BeaconGH Training',
        description: 'Vocational skills and employment preparation',
        icon: '💼',
        color: '#9C27B0',
        services: [
          'Vocational training',
          'Computer literacy',
          'Job placement',
          'Resume building',
          'Interview preparation'
        ],
        resources: [
          'Training workshops',
          'Employer partnerships',
          'Equipment lending',
          'Certification programs'
        ],
        isAvailable: true,
        capacity: 92,
        contactEmail: 'training@beacongh.org',
        contactPhone: '+233501234572',
        donationUrl: 'https://beaconnewbeginnings.org/donate/training',
        jobOpenings: [
          JobOpportunity(
            id: 'job_trainer_001',
            title: 'Vocational Skills Trainer',
            type: 'part-time',
            description: 'Teach vocational skills and job readiness',
            requirements: [
              'Trade certification or degree',
              'Teaching or training experience',
              'Passion for empowerment'
            ],
            location: 'Training centers in Accra',
            isRemote: false,
            applicationEmail: 'jobs.training@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 6)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_education',
        name: 'BeaconGH Education Assistance',
        shortName: 'BeaconGH Education',
        description: 'Educational support and literacy programs',
        icon: '🎓',
        color: '#FF6B35',
        services: [
          'Adult literacy',
          'GED preparation',
          'Scholarship assistance',
          'Children\'s tutoring',
          'Educational counseling'
        ],
        resources: [
          'Literacy classes',
          'Educational materials',
          'Tutoring services',
          'Scholarship fund'
        ],
        isAvailable: true,
        capacity: 90,
        contactEmail: 'education@beacongh.org',
        contactPhone: '+233501234573',
        donationUrl: 'https://beaconnewbeginnings.org/donate/education',
        jobOpenings: [
          JobOpportunity(
            id: 'edu_coord_001',
            title: 'Education Coordinator',
            type: 'full-time',
            description: 'Manage educational programs and partnerships',
            requirements: [
              'Education or social work degree',
              'Program management experience',
              'Knowledge of Ghana education system'
            ],
            location: 'Accra',
            isRemote: false,
            applicationEmail: 'jobs.education@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 8)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_financial',
        name: 'BeaconGH Financial Options',
        shortName: 'BeaconGH Financial',
        description: 'Financial literacy and emergency assistance',
        icon: '💰',
        color: '#388E3C',
        services: [
          'Emergency financial aid',
          'Financial literacy training',
          'Micro-loans',
          'Savings programs',
          'Budget counseling'
        ],
        resources: [
          'Emergency fund',
          'Financial workshops',
          'Banking partnerships',
          'Credit building'
        ],
        isAvailable: true,
        capacity: 85,
        contactEmail: 'financial@beacongh.org',
        contactPhone: '+233501234574',
        donationUrl: 'https://beaconnewbeginnings.org/donate/financial',
        jobOpenings: [
          JobOpportunity(
            id: 'fin_advisor_001',
            title: 'Financial Literacy Advisor',
            type: 'part-time',
            description: 'Provide financial education and counseling',
            requirements: [
              'Finance or economics background',
              'Experience with financial counseling',
              'Knowledge of Ghana banking system'
            ],
            location: 'Accra and Tema',
            isRemote: true,
            applicationEmail: 'jobs.financial@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 3)),
            isUrgent: false,
          ),
        ],
      ),
      BeaconDivision(
        id: 'beacon_basic_needs',
        name: 'BeaconGH Food & Clothing Assistance',
        shortName: 'BeaconGH Basic Needs',
        description: 'Emergency food, clothing, and essential supplies',
        icon: '🍽️',
        color: '#D32F2F',
        services: [
          'Food pantry',
          'Clothing bank',
          'Emergency supplies',
          'Meal programs',
          'Hygiene kits'
        ],
        resources: [
          'Food distribution',
          'Clothing donations',
          'Emergency supplies',
          'Mobile food truck'
        ],
        isAvailable: true,
        capacity: 95,
        contactEmail: 'basicneeds@beacongh.org',
        contactPhone: '+233501234575',
        donationUrl: 'https://beaconnewbeginnings.org/donate/basicneeds',
        jobOpenings: [
          JobOpportunity(
            id: 'dist_coord_001',
            title: 'Distribution Coordinator',
            type: 'part-time',
            description: 'Coordinate food and clothing distribution',
            requirements: [
              'Logistics or supply chain experience',
              'Community outreach skills',
              'Physical ability to handle donations'
            ],
            location: 'Distribution centers in Greater Accra',
            isRemote: false,
            applicationEmail: 'jobs.basicneeds@beacongh.org',
            postedDate: DateTime.now().subtract(Duration(days: 1)),
            isUrgent: true,
          ),
        ],
      ),
    ];
  }

  static List<BeaconDivision> _prioritizeForShelter(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    // First priority: BeaconGH Shelter
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_shelter'));
    
    // Second priority: Other Beacon divisions that can help
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_basic_needs'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_healthcare'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_counseling'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForLegal(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_legal'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_shelter'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_counseling'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForCounseling(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_counseling'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_groups'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_healthcare'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForHealthcare(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_healthcare'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_financial'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_counseling'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForJobTraining(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_job_training'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_education'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_financial'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForEducation(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_education'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_job_training'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_financial'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForFinancial(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_financial'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_job_training'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_basic_needs'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeForBasicNeeds(List<BeaconDivision> divisions, String urgency) {
    List<BeaconDivision> prioritized = [];
    
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_basic_needs'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_shelter'));
    prioritized.add(divisions.firstWhere((d) => d.id == 'beacon_financial'));
    
    return prioritized;
  }

  static List<BeaconDivision> _prioritizeGeneral(List<BeaconDivision> divisions, String urgency) {
    // Return all divisions for general help
    return divisions;
  }

  // AI-powered job matching
  static List<JobOpportunity> getRelevantJobs({
    required String userSkills,
    required String location,
    String? availability,
  }) {
    List<JobOpportunity> allJobs = [];
    
    // Collect all jobs from all divisions
    for (BeaconDivision division in _getAllBeaconDivisions()) {
      allJobs.addAll(division.jobOpenings);
    }
    
    // AI Logic: Match jobs based on user profile
    allJobs.sort((a, b) {
      int scoreA = _calculateJobMatchScore(a, userSkills, location, availability);
      int scoreB = _calculateJobMatchScore(b, userSkills, location, availability);
      return scoreB.compareTo(scoreA); // Higher score first
    });
    
    return allJobs;
  }

  static int _calculateJobMatchScore(JobOpportunity job, String userSkills, String location, String? availability) {
    int score = 0;
    
    // Location matching
    if (job.location.toLowerCase().contains(location.toLowerCase()) || job.isRemote) {
      score += 30;
    }
    
    // Skills matching (basic keyword matching)
    List<String> userSkillsList = userSkills.toLowerCase().split(',');
    for (String skill in userSkillsList) {
      if (job.description.toLowerCase().contains(skill.trim()) ||
          job.requirements.any((req) => req.toLowerCase().contains(skill.trim()))) {
        score += 20;
      }
    }
    
    // Availability matching
    if (availability != null) {
      if (availability.toLowerCase().contains('volunteer') && job.type == 'volunteer') {
        score += 25;
      }
      if (availability.toLowerCase().contains('full') && job.type == 'full-time') {
        score += 25;
      }
      if (availability.toLowerCase().contains('part') && job.type == 'part-time') {
        score += 25;
      }
    }
    
    // Urgency bonus
    if (job.isUrgent) {
      score += 15;
    }
    
    // Recent posting bonus
    if (job.postedDate.isAfter(DateTime.now().subtract(Duration(days: 7)))) {
      score += 10;
    }
    
    return score;
  }
}