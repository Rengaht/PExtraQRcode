PImage createQRCode(String guid_,int size){
  String url_=_global.ServerURL+"upload/direct.php?id="+guid_;
  String gooapi_request="http://chart.googleapis.com/chart?" // Google Charts Endpoint
                     +"chs="+size+"x"+size+"&"               // chart size
                     +"cht=qr&"                      // chart type: QR Code
                     +"chld=M|0"
                     +"choe=UTF-8&"                          // Encoding
                     +"chl="+url_;                           // url
  


  PImage img_=loadImage(gooapi_request,"png");  
  
  return img_; 
}