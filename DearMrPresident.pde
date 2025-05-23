import java.util.*;
final String[] ALP = {"A","Z","Y","X","W","V","U","T","S","R","Q","P","O","N","M","L","K","J","I","H","G","F","E","D","C","B"};
final String[] RALP = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
String[] checkDecrypt = {"j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","a","b","c","d","e","f","g","h","i"};
String[] decrypt = new String[26];
String t="";
String note="Mr. President,\n\nThe paper is in Caesar code. Use the\ndecoder wheel and spin it so the\nsmall number is today's code. We \nexpect a response from you soon.\n\nTo decode the note quicker, press \",\"\nwhile looking at the wheel after\nyou've found the correct code.\n\nP.S. The code is the month and day\nof your inauguration speech";
String paper="Uvri Di. Givjzuvek,                                                     Nv yrmv efkztvu jfdv ivgfikj fw vjgzferxv nzkyze kyv Nyzkv Yfljv, jf nv riv krbzex vokir givtrlkzfej sp vetipgkzex kyzj cvkkvi. Kyvjv riv czbvcp lewfleuvu svczvwj, slk zk zj r xffu jvtlizkp dvrjliv evmvikyvcvjj.";
String adfgvxCode="h8a1pyf6i9nlswe5kg7od4uc3tvrb2j0mqxz";
String decryptedPaper=paper;
String finalCode="";
boolean menu=true;
boolean desk=false;
boolean zoom=false;
boolean zoomWheel=false;
boolean zoomNote=false;
boolean rdrawer=false;
boolean ldrawer=false;
boolean adfgvx=false;
boolean adfGlassesOn=false;
boolean glasses=false;
boolean wheelText=true;
boolean hasClicked=false;
boolean win=false;
boolean superWin=false;
boolean triplewin=false;
int spin=52;
int background=250;
int glassesIndex=0;
int level=1;
int tick=0;
void setup(){
  size(800,600);
  //decrypt=checkDecrypt; //debug line
  //adfGlassesOn=true;
}

void draw(){
  background(background);
  textAlign(BASELINE);
  if(level==2&&tick==0){
    paper="GFFFA FVGXF VGAVV GFFFA DFGFF FDVVD ,AFDA VDFFV GVDAA FFDXA FFAVD DXFFV DVDFF VGAAA FGFVV FFFFD VGXGD XFAVV GGDXF DFFDF FGF,F DFFAF VGFFG VFADF DVFXX FGDVG FFFAF FGXGV VGFFF FDVGX VGAXA VVDDF GDDVF AVDGD FVFFF FAVVD AADFF ADVGD VDFFF AAFDA FF.FD FFGFG DDV'VD FVDVG DFDAA GDFDA VVGGD DADFG XDFFF DVVDV DAADF FAFAA VAXDF FA,GD VGFDAA GDVDA AFFAX AFVGF F,FAD FGDFD GDFDF FXFGV FAVDA FFAFA GVXFF FVDAA FFAXF DDFDX DXVGF FAFGF VDAAD FFA.";
    decryptedPaper=paper;
    note="Mr. President,\n\nWe have reason to believe a spy\n broke in and read your last\nletter. They escaped using your\nemergency ejector seat, but we are\ndetermined to track them down.\n\nThis cipher is in ADFGVX.\nUse \",\" again to decode it after\ncalibrating your decoding device.";
    glasses=false;
    glassesIndex=0;
    t="";
    decrypt=new String[0];
    tick++;
  }
  if(menu){
    background(120,64,0);
    fill(229,222,207);
    rect(200,100,400,350,10);
    fill(0);
    textSize(45);
    text("Dear Mr. President",230,200);
    text("START GAME",280,360);
    if(triplewin){
      text("Secret Level Complete!",190,80);
    }else if(superWin){
      text("Level 2 Complete!",250,80);
    }else if(win){
      text("Level 1 Complete!",250,80);
    }
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
    if(level==1){
      fill(80);
      circle(620,220,40);
      circle(620,220,27);
    }else if(level==2){
      fill(229,222,207);
      rect(100,150,100,150);
      fill(20);
      line(130,180,130,240);
      line(170,180,170,240);
      line(110,200,190,200);
      line(110,220,190,220);
    }
    //postit
    fill(200,170,80);
    rect(610,300,50,50);
    //postit scribble
    fill(20);
    text("~~~,\n~~~.~~~\n~~~~~~.",615,315);
    if(!hasClicked){
      textSize(30);
      text("Click around to read papers and use objects.",130,100);
    }
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
    if(adfGlassesOn){
      decryptedPaper="Dear Mr. President,                                                   After the last letter had been compromised, we are using more secure encryptions to keep this note safe. We don't know how proficient this spy is, or who they are, so now we must assume thay will read this. We will talk soon about how to find this spy.";
      fill(210,210,0);
      rect(650,350,100,100);
      fill(20);
      textSize(12);
      text("         ACTIVATE\nSECRET TRAPDOOR",653,390);
    }
    textSize(20);
    fill(20);
    text(decryptedPaper,220,45,360,600);
    if(Arrays.equals(decrypt,checkDecrypt)){
      fill(180,10,10);
      circle(700,400,100);
      fill(20);
      textSize(13);
      text("      ACTIVATE\nEJECTOR SEAT",660,390);
    }
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
    fill(20);
    if(glasses){
      textSize(20);
      if(glassesIndex<RALP.length){
        text("Input the decrypted letter corresponding to: "+RALP[glassesIndex],400,50);
        text(t,400,100);
      }
    }
    text("To decrypt a letter, find it on the inside of the wheel.\nThe letter on the outside wheel is the plaintext letter.",400,530);
    if(wheelText){
      text("Spin the wheel using the\nleft and right arrow keys.",680,300);
    }
    if(glassesIndex==26){
      text("If you want to reset the\ndecoder, press \".\"",120,300);
    }
  }else if(zoomNote){
    background(120,64,0);
    fill(200,170,80);
    rect(200,100,400,400);
    fill(20);
    textSize(25);
    text(note,210,140);
  }else if(ldrawer){
    background=0;
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
    background=0;
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
    text(finalCode,430,340);
    textSize(30);
    text("The code is a 4 digit number.",230,100);
  }else if(adfgvx){
    //h8a1pyf6i9nlswe5kg7od4uc3tvrb2j0mqxz
    background(120,64,0);
    fill(229,222,207);
    rect(200,10,400,580);
    fill(20);
    textSize(27);
    for(int i=0;i<6;i++){
      line(250+50*i,60,250+50*i,460);
      line(215,110+60*i,550,110+60*i);
    }
    text("A",268,93);
    text("D",318,93);
    text("F",368,93);
    text("G",418,93);
    text("V",468,93);
    text("X",518,93);
    text("A",220,150);
    text("D",220,210);
    text("F",220,270);
    text("G",220,330);
    text("V",220,390);
    text("X",220,450);
    textSize(20);
    for(int i=0;i<6;i++){
      for(int j=0;j<6;j++){
        text(adfgvxCode.charAt((6*i)+j),268+50*j,150+60*i);
      }
    }
    textSize(20);
    text("Each letter is encoded\ninto a letter pair.\nThe first letter is the\nrow, and the second\nis the column\nin this grid.\n(spaces are ignored)",15,100);
    if(glasses){
      if(!adfGlassesOn){
        text("Input the decoded\nmessage for the code:\nVDAAF FGXDX GDGXF\nVFAVD VGDFF VFFFA\nXFDFG FDVDF FXAAV\nFAFVD AGVXX DXDAF\nXF",615,100);
        text(t,615,300,170,1000);
        //fill(200,0,0);
        //line(610+t.length()*20,120,630+t.length()*20,120);
      }else{
        text("Success!",615,100);
      }
    }
  }
}

void mouseClicked(){
  if(menu){
    if(mouseX>200&&mouseX<600&&mouseY<450&&mouseY>100){
      desk=true;
      menu=false;
      if(win){
        level=2;
      }
    }
  }else if(desk){
    if(!hasClicked){
      hasClicked=true;
    }
    //click paper
    if(mouseX>300&&mouseX<500&&mouseY<450&&mouseY>150){
      desk=false;
      zoom=true;
    }else if(mouseX>600&&mouseX<640&&mouseY>200&&mouseY<240&&level==1){
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
    }else if(mouseX>100&&mouseX<200&&mouseY>150&&mouseY<300&&level==2){
      adfgvx=true;
      desk=false;
    }
  }else if(zoom){
    if(adfGlassesOn){
      if(mouseX>650&&mouseX<750&&mouseY>350&&mouseY<450){
        superWin=true;
        zoom=false;
        menu=true;
      }else if(mouseX>600||mouseX<200){
        zoom=false;
        desk=true;
      }
    }else if(!Arrays.equals(decrypt,checkDecrypt)){
      if(mouseX>600||mouseX<200){
        zoom=false;
        desk=true;
      }
    }else{
      if(mouseX>600&&mouseX<800&&mouseY>300&&mouseY<500){
        zoom=false;
        win=true;
        menu=true;
      }else if(mouseX>600||mouseX<200){
        zoom=false;
        desk=true;
      }
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
  }else if(adfgvx){
    if(mouseX>600||mouseX<200){
      adfgvx=false;
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
    }else if(!(key==ENTER||key==RETURN||keyCode==SHIFT||key==DELETE||key==BACKSPACE)&&glasses&&t.length()<1&&glassesIndex<RALP.length){
      t+=key;
      decrypt[glassesIndex]=String.valueOf(key);
    }else if((key==ENTER||key==RETURN)&&glasses){
      t="";
      if(glassesIndex<RALP.length){
        glassesIndex++;
      }
    }else if((key==DELETE||key==BACKSPACE)&&glasses&&t.length()==1){
      t="";
    }
  }else if(adfgvx){
    if(key==','){
      if(glasses){
        glasses=false;
      }else{
        glasses=true;
      }
    }else if(!(key==ENTER||key==RETURN||keyCode==SHIFT||key==DELETE||key==BACKSPACE)&&glasses){
      t+=key;
    }else if((key==DELETE||key==BACKSPACE)&&glasses&&t.length()>0){
      t=t.substring(0,t.length()-1);
    }else if(key==ENTER||key==RETURN){
      if(t.replaceAll("\\s","").toLowerCase().equals("theclockstrikesmidnightat1200am")){
        t="";
        adfGlassesOn=true;
      }
    }
  }else if(rdrawer){
    if(!(key==ENTER||key==RETURN||keyCode==SHIFT||key==DELETE||key==BACKSPACE)){
      finalCode+=key;
    }else if((key==DELETE||key==BACKSPACE)&&finalCode.length()>0){
      finalCode=finalCode.substring(0,finalCode.length()-1);
    }else if(key==ENTER||key==RETURN){
      if(finalCode.equals("1812")){
        rdrawer=false;
        menu=true;
        triplewin=true;
      }
    }
  }
}
