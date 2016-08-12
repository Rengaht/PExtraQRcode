String[] listFileNames(String dir_){
  File file=new File(dir_);
  if(file.isDirectory()){
    String names[] = file.list();
    return names;
  }else{ // If it's not a directory
    return null;
  }
}


void checkUpdate(){
  String[] order_=listFileNames(_global.OrderFolder);
  if(order_!=null && order_.length>0){
    loadUser(order_[0]);  
    File file=new File(_global.OrderFolder+order_[0]);
    file.delete();
  }
  
}