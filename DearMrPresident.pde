final String[] ALP = {"A","Z","Y","X","W","V","U","T","S","R","Q","P","O","N","M","L","K","J","I","H","G","F","E","D","C","B"};
boolean menu=true;
boolean desk=false;
boolean zoom=false;
boolean zoomWheel=false;
int spin=52;
int background=250;
void setup(){
  size(800,600);
}

void draw(){
  background(background);
  textAlign(BASELINE);
  if(menu){
    background=200;
    fill(255);
    rect(200,100,400,350,10);
    fill(0);
    textSize(50);
    text("Start",350,300);
  }else if(desk){
    background=0;
    //desk
    fill(120,64,0);
    rect(20,20,760,540);
    //paper
    fill(229,222,207);
    rect(300,150,200,300);
    //scribble
    textSize(10);
    fill(20);
    text("~~~~~~~~~~~~,\n~~~~~~~~.~~~~~~~~~~~,~~~~~~~~~~.~~~~~\n~~~~~~~~~~~~~~~~,~~~~~~'~~~~~~.~~~~~~~~\n~~~~~~~~~~~~.~~~~~~~~~~~~~~.~~~~~~~~,\n~~~~.~~~~~~~~~~~~~~~~~,~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~'~~~~~~~~~~~~~~~~.~\n~~~~~~~~~~~~~~~~'~~~~~~~~~~~~~~~~\n~~~~~~~.~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~,~~~~~~~~~~~,~~~~~~~~~~,~~~~\n~~~~~~~~~~~,~~~~~~~~~~~~~~~~~\n~~~~~~~.~~~~~~~~~~~~~~~~~~~~~~~~~,~~~~\n~~~~~~~~,~~~~~~~~~~~~~~~~~~~,~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~'~.~~~~~~~~~\n~~~~~~~~~~,~~~~~~~~~~.~~~~~~~~~~~.~~~\n~~~~~~~~,~~~~~~~~~~~~~~,~~~~~~~~~~~~~~\n~~~~~~~~~~.~~~~~~~~~~~~~~,~~~~~~~~~'~\n~~~~~~~~~~~~~~~,~~~~~~~~~~~~~,~~~~~~~~.",310,180);
    //wheel
    fill(80);
    circle(620,220,40);
    circle(620,220,27);
    //postit
    fill(200,170,80);
    rect(610,300,50,50);
    //postit scribble
    fill(20);
    text("~~~,\n~~~.~~~\n~~~~~~.",615,315);
}else if(zoom){
    background(120,64,0);
    fill(229,222,207);
    rect(200,10,400,580);
    textSize(20);
    fill(20);
    text("Dear Mr. President,\nLorem ipsum dolor sit amet",220,45);
  }else if(zoomWheel){
    background(120,64,0);
    fill(100);
    circle(400,300,320);
    circle(400,300,230);
    textAlign(CENTER,CENTER);
    textSize(20);
    fill(255);
    for(int i=0;i<ALP.length;i++){
      double theta=89.489+.24*i;
      push();
      translate(400+(int)(Math.cos(theta)*140),300-(int)(Math.sin(theta)*140));
      rotate(-radians(13.8455*i));
      text(ALP[i],0,0);
      pop();
    }
    for(int i=0;i<ALP.length;i++){
      double theta=89.5+.24*(i-spin);
      push();
      translate(400+(int)(Math.cos(theta)*90),300-(int)(Math.sin(theta)*90));
      rotate(-radians(13.8461538462*(i-spin)));
      text(ALP[i],0,0);
      pop();
    }
    text(spin%26+1,400,270);
  }
}

void mouseClicked(){
  if(menu){
    if(mouseX>200&&mouseX<600&&mouseY<450&&mouseY>100){
      desk=true;
      menu=false;
    }
  }else if(desk){
    //click paper
    if(mouseX>300&&mouseX<500&&mouseY<450&&mouseY>150){
      desk=false;
      zoom=true;
    }else if(mouseX>600&&mouseX<640&&mouseY>200&&mouseY<240){
      //click wheel
      desk=false;
      zoomWheel=true;
    }
  }else if(zoom){
    if(mouseX>600||mouseX<200){
      zoom=false;
      desk=true;
    }
  }
}

void keyPressed(){
  if(zoomWheel){
    if(keyCode==RIGHT){
      spin++;
    }else if(keyCode==LEFT){
      spin--;
    }
  }
}
