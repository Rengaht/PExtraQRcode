class GlobalParameter{
  

  String OrderFolder;
  String OutputFolder;
  String ServerURL;
  int OscPort;
  
  
  GlobalParameter(){
     readParam(); 
  }
  
  void readParam(){
    
    XML param_xml;
    try{
      param_xml=loadXML("data\\param_file.xml");
    }catch(Exception e){
      println("No existing fil, write param...");
      writeParam();
      return;
    }
    println("__Read Parameters__");
    
    OrderFolder=param_xml.getChildren("ORDER_FOLDER")[0].getContent();
    println("__OrderFolder= "+OrderFolder);
    
    OutputFolder=param_xml.getChildren("OUTPUT_FOLDER")[0].getContent();
    println("__OutputFolder= "+OutputFolder);
    
    ServerURL=param_xml.getChildren("SERVER_URL")[0].getContent();
    println("__ServerURL= "+ServerURL);
    
  
    OscPort=parseInt(param_xml.getChildren("OSC_PORT")[0].getContent());
    println("__OscPort= "+OscPort);
  
  }
  
  void writeParam(){
    XML xml=new XML("PARAM");
       
     
    //XML of=xml.addChild("ORDER_FOLDER");
    //of.setContent(OrderFolder);
    
    XML pf=xml.addChild("OUTPUT_FOLDER");
    pf.setContent(OutputFolder);
    
    XML surl=xml.addChild("SERVER_URL");
    surl.setContent(ServerURL);
      
    XML oscport=xml.addChild("OSC_PORT");
    oscport.setContent(String.valueOf(OscPort));
       
    saveXML(xml,"data\\param_file.xml");
    
  }

}