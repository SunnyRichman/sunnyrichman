class ContactsModel{

  String iconpath;
  String label;
  String path;
  String type;

  ContactsModel({required this.iconpath, required this.label, required this.path, required this.type});

  static List<ContactsModel> getContacts(){
    List<ContactsModel> model = [];

    model.add(ContactsModel(iconpath: 'assets/icons/contacts/telephone.svg', label: '064-8131412', path: '0648131412', type: 'phone'));
    model.add(ContactsModel(iconpath: 'assets/icons/contacts/gmail.svg', label: 'Send me Gmail!', path: 'raweerot.bha@student.mahidol.edu', type: 'email'));
    model.add(ContactsModel(iconpath: 'assets/icons/contacts/outlook.svg', label: 'Send me Outlook mail!', path: 'raweerot.bha@student.mahidol.ac.th', type: 'email'));
    model.add(ContactsModel(iconpath: 'assets/icons/contacts/github.svg', label: 'View my Github repos!', path: 'https://github.com/SunnyRichman/', type: 'url'));
    model.add(ContactsModel(iconpath: 'assets/icons/contacts/linkedin.svg', label: 'Visit my LinkedIn!', path: 'https://linkedin.com/in/sunnyict20', type: 'url'));

    return model;
  }
}