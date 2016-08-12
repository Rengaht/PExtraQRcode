import netP5.*;
import oscP5.*;

import http.requests.*;

import java.io.*;
import java.net.*;
import java.util.Arrays;

OscP5 oscP5;

PImage _img_back;

GlobalParameter _global;
String _last_id;
boolean _sd_file_loaded; 

String[] _img_id;
PImage[] _img_sticker;
PImage[] _img_qrcode;

float _qrwid;

void setup(){
  
 //size(720,1280); 
  fullScreen(2);
  
  _global=new GlobalParameter();
  
 // oscP5 = new OscP5(this,_global.OscPort);
  
  _last_id="";
  _sd_file_loaded=false;
  
  _img_id=new String[2];
  _img_sticker=new PImage[2];
  _img_qrcode=new PImage[2];
  
  _img_back=loadImage("back.jpg");
  
  
  _qrwid=(float)width*.33;
}

void draw(){
  
  image(_img_back,0,0,width,height);
  textAlign(CENTER);
  
  
  // draw last 2 qrcode
  for(int i=0;i<2;++i){
    if(_img_sticker[i]!=null) image(_img_sticker[i],width/2-_qrwid*1.2,height/2.5-_qrwid+_qrwid*1.2*i,_qrwid,_qrwid);    
    if(_img_qrcode[i]!=null) image(_img_qrcode[i],width/2+_qrwid*.2,height/2.5-_qrwid+_qrwid*1.2*i,_qrwid,_qrwid);
    if(_img_id[i]!=null){
      pushStyle();
        fill(0);
        text(_img_id[i],width/2+_qrwid/2,height/2.5-_qrwid+_qrwid*1.2*i-20);
      popStyle();
    }
  }
  
  if(frameCount%30==0) checkUpdate();
  
}

void loadUser(String id_){
  if(_img_id[0]!=null){
    _img_id[1]=_img_id[0];  
    _img_qrcode[1]=_img_qrcode[0].get();
    _img_sticker[1]=_img_sticker[0].get();
  }
  _img_id[0]=id_;
  _img_qrcode[0]=null;
  _img_qrcode[0]=createQRCode(id_,floor(_qrwid));
  _img_sticker[0]=loadImage(_global.OutputFolder+"st_"+id_+".png");
}


void keyPressed(){
  switch(key){
    case 'n':
      checkUpdate();
      break;
    
  }
}