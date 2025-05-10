
boolean menu=true;
boolean desk=false;
boolean zoom=false;
int background=250;
void setup(){
  size(800,600);
}

void draw(){
  background(background);
  if(menu){
    background=200;
    fill(255);
    rect(200,100,400,350,10);
    fill(0);
    textSize(50);
    text("Start",350,300);
  }else if(desk){
    background=0;
    fill(120,64,0);
    rect(20,20,760,540);
    fill(229,222,207);
    rect(300,150,200,300);
    textSize(10);
    fill(20);
    text("~~~~~~~~~~~~,\n~~~~~~~~.~~~~~~~~~~~,~~~~~~~~~~.~~~~~\n~~~~~~~~~~~~~~~~,~~~~~~'~~~~~~.~~~~~~~~\n~~~~~~~~~~~~.~~~~~~~~~~~~~~.~~~~~~~~,\n~~~~.~~~~~~~~~~~~~~~~~,~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~'~~~~~~~~~~~~~~~~.~\n~~~~~~~~~~~~~~~~'~~~~~~~~~~~~~~~~\n~~~~~~~.~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~,~~~~~~~~~~~,~~~~~~~~~~,~~~~\n~~~~~~~~~~~,~~~~~~~~~~~~~~~~~\n~~~~~~~.~~~~~~~~~~~~~~~~~~~~~~~~~,~~~~\n~~~~~~~~,~~~~~~~~~~~~~~~~~~~,~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~'~.~~~~~~~~~\n~~~~~~~~~~,~~~~~~~~~~.~~~~~~~~~~~.~~~\n~~~~~~~~,~~~~~~~~~~~~~~,~~~~~~~~~~~~~~\n~~~~~~~~~~.~~~~~~~~~~~~~~,~~~~~~~~~'~\n~~~~~~~~~~~~~~~,~~~~~~~~~~~~~,~~~~~~~~.",310,180);
  }else if(zoom){
    background(120,64,0);
    fill(229,222,207);
    rect(200,10,400,580);
    textSize(20);
    fill(20);
    text("Dear Mr. President,\nLorem ipsum dolor sit amet",220,45);
  }
}

void mouseClicked(){
  if(menu){
    if(mouseX>200&&mouseX<600&&mouseY<450&&mouseY>100){
      desk=true;
      menu=false;
    }
  }else if(desk){
    if(mouseX>300&&mouseX<500&&mouseY<450&&mouseY>150){
      desk=false;
      zoom=true;
    }
  }
}
