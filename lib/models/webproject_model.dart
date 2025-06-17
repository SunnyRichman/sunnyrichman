class WebprojectGallery {

  String label;
  String imgpath;

  WebprojectGallery({required this.label, required this.imgpath});

  static List<WebprojectGallery> getGallery(){
    List<WebprojectGallery> model = [];
    model.add(WebprojectGallery(label: 'Index', imgpath: 'assets/festa_project/index.png'));
    model.add(WebprojectGallery(label: 'Album Page', imgpath: 'assets/festa_project/albumPage.png'));
    model.add(WebprojectGallery(label: 'Search Page', imgpath: 'assets/festa_project/searchPage.png'));
    model.add(WebprojectGallery(label: 'Search Results', imgpath: 'assets/festa_project/searchResults.png'));
    model.add(WebprojectGallery(label: 'Admin Portal', imgpath: 'assets/festa_project/adminPortal.png'));
    model.add(WebprojectGallery(label: 'Admin A/C Form', imgpath: 'assets/festa_project/adminAccManagement1.png'));
    model.add(WebprojectGallery(label: 'Admin A/C Management', imgpath: 'assets/festa_project/adminAccManagement2.png'));
    model.add(WebprojectGallery(label: 'Album Form', imgpath: 'assets/festa_project/albumManagement1.png'));
    model.add(WebprojectGallery(label: 'Albums Management', imgpath: 'assets/festa_project/albumManagement2.png'));
    model.add(WebprojectGallery(label: 'Single Album Management', imgpath: 'assets/festa_project/singleAlbumManagement.png'));
    model.add(WebprojectGallery(label: 'Team Page', imgpath: 'assets/festa_project/teamPage.png'));
    
    return model;
  }

}

class WebprojectTools{

  String label;
  String iconpath;
  WebprojectTools({required this.label, required this.iconpath});
  
  static List<WebprojectTools> getTools(){
    List<WebprojectTools> tools = [];
    tools.add(WebprojectTools(label: 'HTML', iconpath: 'assets/icons/expertises/html5.svg'));
    tools.add(WebprojectTools(label: 'CSS', iconpath: 'assets/icons/expertises/css.svg'));
    tools.add(WebprojectTools(label: 'JavaScript', iconpath: 'assets/icons/expertises/javascript.svg'));
    tools.add(WebprojectTools(label: 'Node.js', iconpath: 'assets/icons/expertises/nodedotjs.svg'));
    tools.add(WebprojectTools(label: 'MySQL', iconpath: 'assets/icons/expertises/mysql.svg'));
    return tools;
  }

}