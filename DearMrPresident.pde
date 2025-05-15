import java.util.*;
final String[] ALP = {"A","Z","Y","X","W","V","U","T","S","R","Q","P","O","N","M","L","K","J","I","H","G","F","E","D","C","B"};
final String[] RALP = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
String[] decrypt = new String[26];
String t="";
String paper="Uvri Di. Givjzuvek,                                                     Nv yrmv efkztvu jfdv ivgfikj fw vjgzferxv nzkyze kyv Nyzkv Yfljv, jf nv riv krbzex vokir givtrlkzfej sp vetipgkzex kyzj cvkkvi. Kyvjv riv czbvcp lewfleuvu svczvwj, slk zk zj r xffu jvtlizkp dvrjliv evmvikyvcvjj.";
String decryptedPaper=paper;
boolean menu=true;
boolean desk=false;
boolean zoom=false;
boolean zoomWheel=false;
boolean zoomNote=false;
boolean rdrawer=false;
boolean ldrawer=false;
boolean glasses=false;
boolean wheelText=true;
int spin=52;
int background=250;
int glassesIndex=0;
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
    //drawers
    rect(50,560,100,13);
    rect(650,560,100,13);
    fill(150,95,0);
    circle(100,580,17);
    circle(700,580,17);
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
    //decrypting
    if(glassesIndex>0){
      decryptedPaper="";
      for(int i=0;i<paper.length();i++){
        if(paper.substring(i,i+1).matches("[a-zA-Z]+")){
          for(int j=0;j<RALP.length;j++){
            if(paper.substring(i,i+1).toLowerCase().equals(RALP[j].toLowerCase())){
              if(paper.substring(i,i+1).equals(RALP[j])){
                decryptedPaper+=decrypt[j].toUpperCase();
              }else{
                decryptedPaper+=decrypt[j];
              }
            }
          }
        }else{
          decryptedPaper+=paper.substring(i,i+1);
        }
      }
    }
    background(120,64,0);
    fill(229,222,207);
    rect(200,10,400,580);
    textSize(20);
    fill(20);
    text(decryptedPaper,220,45,360,600);
  }else if(zoomWheel){
    background(120,64,0);
    fill(100);
    circle(400,300,320);
    circle(400,300,230);
    fill(70);
    rect(380,255,40,30);
    textAlign(CENTER,CENTER);
    textSize(20);
    fill(0);
    for(int i=0;i<ALP.length;i++){
      double theta=89.543+.2419*(i-spin);
      push();
      translate(400+(float)(Math.cos(theta)*140),300-(float)Math.sin(theta)*140);
      rotate(-radians(13.845*(i-spin)));
      text(ALP[i],0,0);
      pop();
    }
    for(int i=0;i<ALP.length;i++){
      double theta=89.56+.2419*i;
      push();
      translate(400+(int)(Math.cos(theta)*90),300-(int)(Math.sin(theta)*90));
      rotate(-radians(13.85*i));
      text(ALP[i],0,0);
      pop();
    }
    text(spin%26+1,400,270);
    text("Caesar Cipher\nWheel",400,320);
    fill(250);
    if(glasses){
      textSize(20);
      if(glassesIndex<RALP.length){
        text("Input the decrypted letter corresponding to: "+RALP[glassesIndex],400,50);
        text(t,400,100);
      }else{
        
      }
    }
    text("To decrypt a letter, find it on the inside of the wheel.\nThe letter on the outside wheel is the plaintext letter.",400,530);
    if(wheelText){
      text("Spin the wheel using the\nleft and right arrow keys",680,300);
    }
    if(glassesIndex==26){
      text("If you want to reset the\ndecoder, press \".\"",70,300);
    }
  }else if(zoomNote){
    background(120,64,0);
    fill(200,170,80);
    rect(200,100,400,400);
    fill(20);
    textSize(25);
    text("Mr. President,\n\nThe paper is in Caesar code. Use the\ndecoder wheel and spin it so the\nsmall number is today's code. We \nexpect a response from you soon.\n\nTo decode the note quicker, press \",\"\nwhile looking at the wheel after\nyou've found the correct code.\n\nP.S. The code is the month and day\nof your inauguration speech",210,140);
  }else if(ldrawer){
    background(0);
    fill(120,64,0);
    rect(0,0,800,170);
    rect(250,170,300,400);
    fill(200,155,90);
    rect(270,170,260,380);
    fill(150,95,0);
    circle(400,580,40);
    fill(229,222,207);
    rect(300,200,200,300);
    //scribble
    textSize(10);
    fill(20);
    text("~~~~~~~~~~~~.~~~~~~~~~~~~~~.~~~~~~~~,\n~~~~.~NEW PRESIDENT SWORN IN~~\n~~~~~~~~~~~~~~~'~~~~~~~~~~~~~~~~.~\n~~~~~~INAUGURATION SPEECH~~~~~~~~~~~\n~~~~~~~.January 8th~~~~~~~~~~~~\n~~~~~~~~~~~,~~~~~~~~~~~,~~~~~~~~~~,~~~~\n~~~~~~~~~~~,~~~~1966~~~~\n~~~~~~~.~~~~~~~~~~~~~~~~~~~~~~~~~,~~~~\n~~~~~~~~,~~~~~~~~~~~~~~~~~~~,~~~~~~~\n~~~~~~~~~~~~~~~~~~Cold War~~~~\n~~~~~~~~~~,~~~~~~~~~~.~~~~~~~~~~~.~~~\n~~~~~~~~,~~~~~~~~~~~~~~,~~~~~~~~~~~~~~\n~~~~~~~~~~.~~~~~SPIES EVERYWHERE~~,~~\n~~~~~~~~~~~~~~~,~~~~~~~~~~~~~,~~~~~~~~.",310,250);
    
  }else if(rdrawer){
    background(0);
    fill(120,64,0);
    rect(0,0,800,170);
    rect(250,170,300,400);
    fill(200,155,90);
    rect(270,170,260,380);
    fill(150,95,0);
    circle(400,580,40);
    fill(100);
    rect(290,230,220,220);
    fill(65);
    circle(440,340,90);
    fill(20);
    textSize(15);
    text("PRESIDENTIAL\nVAULT",320,300);
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
    }else if(mouseX>610&&mouseX<660&&mouseY>300&&mouseY<350){
      //click note
      desk=false;
      zoomNote=true;
    }else if(mouseX<150&&mouseX>50&&mouseY>560&&mouseY<585){
      desk=false;
      ldrawer=true;
    }else if(mouseX<750&&mouseX>650&&mouseY>560&&mouseY<585){
      desk=false;
      rdrawer=true;
    }
  }else if(zoom){
    if(mouseX>600||mouseX<200){
      zoom=false;
      desk=true;
    }
  }else if(zoomWheel){
    if((mouseX>560||mouseX<240)||(mouseY>415||mouseY<185)){
      zoomWheel=false;
      desk=true;
    }
  }else if(zoomNote){
    if(mouseX>600||mouseX<200||mouseY>500||mouseY<100){
      zoomNote=false;
      desk=true;
    }
  }else if(ldrawer){
    if(mouseX>550||mouseX<250){
      ldrawer=false;
      desk=true;
    }
  }else if(rdrawer){
    if(mouseX>550||mouseX<250){
      rdrawer=false;
      desk=true;
    }
  }
}

void keyPressed(){
  if(zoomWheel){
    if(keyCode==RIGHT){
      spin++;
      wheelText=false;
    }else if(keyCode==LEFT){
      spin--;
      wheelText=false;
    }else if(key==','){
      if(glasses){
        glasses=false;
      }else{
        glasses=true;
      }
    }else if(key=='.'){
      glassesIndex=0;
      decrypt=new String[26];
    }else if(!(key==ENTER||key==RETURN||key==SHIFT)&&glasses&&t.length()<1){
      t+=key;
      decrypt[glassesIndex]=String.valueOf(key);
    }else if((key==ENTER||key==RETURN)&&glasses){
      t="";
      if(glassesIndex<RALP.length){
        glassesIndex++;
      }
    }
  }
}
