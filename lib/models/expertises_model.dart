class ExpertiseModel{

  String iconpath;
  String name;

  ExpertiseModel({required this.iconpath, required this.name});

  static List<ExpertiseModel> getExpertise(){
    List<ExpertiseModel> model = [];
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/html5.svg',name: 'HTML'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/css.svg',name: 'CSS'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/javascript.svg',name: 'JavaScript'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/nodedotjs.svg',name: 'NodeJS'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/mysql.svg',name: 'MySQL'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/dart.svg',name: 'Dart'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/flutter.svg',name: 'Flutter'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/java.svg',name: 'Java'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/elasticsearch.svg',name: 'ElasticSearch'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/kibana.svg',name: 'Kibana'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/mongodb.svg',name: 'MongoDB'));
    model.add(ExpertiseModel(iconpath: 'assets/icons/expertises/spring.svg',name: 'Spring'));
    
    return model;
  }
}