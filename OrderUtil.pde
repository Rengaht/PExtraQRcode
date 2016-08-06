String[] listFileNames(String dir_){
  File file=new File(dir_);
  if(file.isDirectory()){
    String names[] = file.list();
    return names;
  }else{ // If it's not a directory
    return null;
  }
}