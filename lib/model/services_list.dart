class ServicesModel {
  final String title;
  ServicesModel({
    required this.title,
  });

  static List<ServicesModel> servicesModel = [
    ServicesModel(title: 'Biomechanics'),
    ServicesModel(title: 'Chiropody & Podiatry'),
    ServicesModel(title: 'Shockwave Therapy'),
    ServicesModel(title: 'Sports Injuries & Foot Pain'),
    ServicesModel(title: 'Foot & Ankle Surgery'),
    ServicesModel(title: 'Laser Treatment for Fungal Infection'),
    ServicesModel(title: 'Cosmatic Foot Sergery'),
    ServicesModel(title: 'Foot Botox'),
  ];
}

class ChiropodyModel {
  final String title;
  ChiropodyModel({required this.title});

  static List<ChiropodyModel> chiropodyModel = [
    ChiropodyModel(title: 'Diagnostic Ultrasound'),
    ChiropodyModel(title: 'Trigger Point Dry Needling'),
    ChiropodyModel(title: 'Physiotherapy'),
    ChiropodyModel(title: 'Extracorporeal Shockwave Therapy'),
  ];
}
