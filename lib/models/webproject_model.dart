class IrprojectGallery {

  String label;
  String imgpath;

  IrprojectGallery({required this.label, required this.imgpath});

  static List<IrprojectGallery> getGallery(){
    List<IrprojectGallery> Gallery = [];
    Gallery.add(IrprojectGallery(label: 'Index', imgpath: 'assets/ir_project/index.jpg'));
    Gallery.add(IrprojectGallery(label: 'One Word Query', imgpath: 'assets/ir_project/onewordquery.jpg'));
    Gallery.add(IrprojectGallery(label: 'One Word Query Result', imgpath: 'assets/ir_project/onewordqueryResult.jpg'));
    Gallery.add(IrprojectGallery(label: 'Multiple Word Query', imgpath: 'assets/ir_project/multiplewordquery.jpg'));
    Gallery.add(IrprojectGallery(label: 'Multiple Word Query Result', imgpath: 'assets/ir_project/multiplewordqueryResult.jpg'));
    Gallery.add(IrprojectGallery(label: 'Partial Match', imgpath: 'assets/ir_project/partialmatch.jpg'));
    Gallery.add(IrprojectGallery(label: 'Partial Match Result', imgpath: 'assets/ir_project/partialmatchResult.jpg'));
    Gallery.add(IrprojectGallery(label: 'Ranking Result', imgpath: 'assets/ir_project/ranking.jpg'));
    return Gallery;
  }

}

class IrprojectTools{

  String label;
  String iconpath;
  IrprojectTools({required this.label, required this.iconpath});
  
  static List<IrprojectTools> getTools(){
    List<IrprojectTools> tools = [];
    tools.add(IrprojectTools(label: 'HTML', iconpath: 'assets/icons/expertises/html5.svg'));
    tools.add(IrprojectTools(label: 'CSS', iconpath: 'assets/icons/expertises/css.svg'));
    tools.add(IrprojectTools(label: 'JavaScript', iconpath: 'assets/icons/expertises/javascript.svg'));
    tools.add(IrprojectTools(label: 'Node.js', iconpath: 'assets/icons/expertises/nodedotjs.svg'));
    tools.add(IrprojectTools(label: 'ElasticSearch', iconpath: 'assets/icons/expertises/elasticsearch.svg'));
    tools.add(IrprojectTools(label: 'Kibana', iconpath: 'assets/icons/expertises/kibana.svg'));
    tools.add(IrprojectTools(label: 'OpenAI(ChatGPT)', iconpath: 'assets/icons/expertises/openai.svg'));
    return tools;
  }

}