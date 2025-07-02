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
        description: 'Planning comprehensive emergency and transitional housing programs',
        icon: '🏠',
        color: '#2E8B57',
        services: [
          'Emergency shelter placement (Coming Soon)',
          'Transitional housing (In Development)',
          'Safety planning (Available)',
          'Children accommodation (Planning)',
          '24/7 security (Future)'
        ],
        resources: [
          'Crisis intervention (Available)',
          'Case management (Coming Soon)',
          'Support groups (Planning)',
          'Community partnerships (Building)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'shelter@beacongh.org',
        contactPhone: '+233501234567',
        donationUrl: 'https://beaconnewbeginnings.org/donate/shelter',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_legal',
        name: 'BeaconGH Legal Assistance',
        shortName: 'BeaconGH Legal',
        description: 'Building legal advocacy network and partnerships for survivors',
        icon: '⚖️',
        color: '#1B5E42',
        services: [
          'Legal representation (Building Network)',
          'Court accompaniment (Future)',
          'Protective orders (Planning)',
          'Family law assistance (Coming Soon)',
          'Immigration support (Future)'
        ],
        resources: [
          'Pro bono lawyers (Recruiting)',
          'Legal aid application (Available)',
          'Court documentation (Future)',
          'Rights education (Planning)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'legal@beacongh.org',
        contactPhone: '+233501234568',
        donationUrl: 'https://beaconnewbeginnings.org/donate/legal',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_counseling',
        name: 'BeaconGH Counseling Services',
        shortName: 'BeaconGH Counseling',
        description: 'Developing trauma-informed therapy and mental health programs',
        icon: '💬',
        color: '#4CAF50',
        services: [
          'Individual therapy (Coming Soon)',
          'Group counseling (Planning)',
          'Family therapy (Future)',
          'Trauma counseling (In Development)',
          'Crisis intervention (Available)'
        ],
        resources: [
          'Licensed therapists (Recruiting)',
          'Support groups (Planning)',
          'Mental health workshops (Future)',
          'Peer counseling (Coming Soon)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'counseling@beacongh.org',
        contactPhone: '+233501234569',
        donationUrl: 'https://beaconnewbeginnings.org/donate/counseling',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_groups',
        name: 'BeaconGH Support Groups',
        shortName: 'BeaconGH Groups',
        description: 'Creating peer support networks and community healing initiatives',
        icon: '👥',
        color: '#FFA726',
        services: [
          'Survivor support circles (Planning)',
          'Peer mentoring (Coming Soon)',
          'Skills workshops (Future)',
          'Community events (Planning)',
          'Healing retreats (Future)'
        ],
        resources: [
          'Weekly group meetings (Planning)',
          'Peer support network (Building)',
          'Online forums (Future)',
          'Resource sharing (Coming Soon)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'groups@beacongh.org',
        contactPhone: '+233501234570',
        donationUrl: 'https://beaconnewbeginnings.org/donate/groups',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_healthcare',
        name: 'BeaconGH Healthcare Support',
        shortName: 'BeaconGH Healthcare',
        description: 'Establishing medical care coordination and health advocacy programs',
        icon: '🏥',
        color: '#64B5F6',
        services: [
          'Medical referrals (Building Network)',
          'Health insurance assistance (Coming Soon)',
          'Mental health medication (Future)',
          'Emergency medical care (Planning)',
          'Health education (Coming Soon)'
        ],
        resources: [
          'Partner clinics (Developing)',
          'Mobile health units (Future)',
          'Prescription assistance (Planning)',
          'Health screenings (Coming Soon)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'healthcare@beacongh.org',
        contactPhone: '+233501234571',
        donationUrl: 'https://beaconnewbeginnings.org/donate/healthcare',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_job_training',
        name: 'BeaconGH Job Training',
        shortName: 'BeaconGH Training',
        description: 'Launching vocational skills and employment preparation programs',
        icon: '💼',
        color: '#9C27B0',
        services: [
          'Vocational training (Planning)',
          'Computer literacy (Coming Soon)',
          'Job placement (Future)',
          'Resume building (Planning)',
          'Interview preparation (Coming Soon)'
        ],
        resources: [
          'Training workshops (Developing)',
          'Employer partnerships (Building)',
          'Equipment lending (Future)',
          'Certification programs (Planning)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'training@beacongh.org',
        contactPhone: '+233501234572',
        donationUrl: 'https://beaconnewbeginnings.org/donate/training',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_education',
        name: 'BeaconGH Education Assistance',
        shortName: 'BeaconGH Education',
        description: 'Developing educational support and literacy programs for survivors and families',
        icon: '🎓',
        color: '#FF6B35',
        services: [
          'Adult literacy (Planning)',
          'GED preparation (Coming Soon)',
          'Scholarship assistance (Future)',
          'Children\'s tutoring (Planning)',
          'Educational counseling (Coming Soon)'
        ],
        resources: [
          'Literacy classes (Developing)',
          'Educational materials (Planning)',
          'Tutoring services (Future)',
          'Scholarship fund (Building)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'education@beacongh.org',
        contactPhone: '+233501234573',
        donationUrl: 'https://beaconnewbeginnings.org/donate/education',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_financial',
        name: 'BeaconGH Financial Options',
        shortName: 'BeaconGH Financial',
        description: 'Creating financial literacy programs and emergency assistance funds',
        icon: '💰',
        color: '#388E3C',
        services: [
          'Emergency financial aid (Planning)',
          'Financial literacy training (Coming Soon)',
          'Micro-loans (Future)',
          'Savings programs (Planning)',
          'Budget counseling (Coming Soon)'
        ],
        resources: [
          'Emergency fund (Building)',
          'Financial workshops (Planning)',
          'Banking partnerships (Developing)',
          'Credit building (Future)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'financial@beacongh.org',
        contactPhone: '+233501234574',
        donationUrl: 'https://beaconnewbeginnings.org/donate/financial',
        jobOpenings: [],
      ),
      BeaconDivision(
        id: 'beacon_basic_needs',
        name: 'BeaconGH Food & Clothing Assistance',
        shortName: 'BeaconGH Basic Needs',
        description: 'Establishing emergency food, clothing, and essential supplies distribution',
        icon: '🍽️',
        color: '#D32F2F',
        services: [
          'Food pantry (Planning)',
          'Clothing bank (Coming Soon)',
          'Emergency supplies (Planning)',
          'Meal programs (Future)',
          'Hygiene kits (Coming Soon)'
        ],
        resources: [
          'Food distribution (Planning)',
          'Clothing donations (Building)',
          'Emergency supplies (Coming Soon)',
          'Mobile food truck (Future)'
        ],
        isAvailable: false,
        capacity: 0,
        contactEmail: 'basicneeds@beacongh.org',
        contactPhone: '+233501234575',
        donationUrl: 'https://beaconnewbeginnings.org/donate/basicneeds',
        jobOpenings: [],
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

  // AI-powered job matching (currently returns empty since no jobs are posted yet)
  static List<JobOpportunity> getRelevantJobs({
    required String userSkills,
    required String location,
    String? availability,
  }) {
    // Return empty list since we're just starting and don't have active job postings yet
    return [];
  }
}