boolean traslapo, reflejo=true;
boolean[]MoverPieza=new boolean[8];
int escala, escala2;
int[]posicionx=new int[8];{
posicionx[1]=600;
posicionx[2]=250;
posicionx[3]=1100;
posicionx[4]=800;
posicionx[5]=1000;
posicionx[6]=450;
posicionx[7]=100;
}
int[]posiciony= new int[8];{
posiciony[1]=350;
posiciony[2]=40;
posiciony[3]=250;
posiciony[4]=100;
posiciony[5]=50;
posiciony[6]=70;
posiciony[7]=400;
}
int[]rotar=new int[8];
color[]colorr=new color[8];{
 colorr[1]=color(255,0,0);
 colorr[2]=color(255,255,0);
 colorr[3]=color(255,255,255);
 colorr[4]=color(255,0,255);
 colorr[5]=color(0,0,255);
 colorr[6]=color(0,255,0);
 colorr[7]=color(0,255,255);
}
void setup(){
  size(1350,690);
}
//giro
void keyPressed(){
  for(int i=1; i<=7; i++)
  {
    if(MoverPieza[i]){
      if(keyCode==LEFT){
        rotar[i]+=1;
      }
      if (keyCode==RIGHT){
        rotar[i]-=1;
      }
    } 
  }
  if (keyCode==UP){
    reflejo=false;   
    escala=-1;
    escala2=1;
  }
  if (keyCode==DOWN){
    reflejo=true;   
    escala=-1;
    escala2=1;
  }
}
void mouseReleased(){
  for(int i=1; i<=7; i++)
  {
    MoverPieza[i]=false;
  }
  traslapo=false;
}
void draw(){
  color colorfigura=get(mouseX, mouseY); //Obtiene el color del pixel donde se encuentra el mouse
  background(90);
  fill(48,99,206);
  rect(470,140,405,405);
  println(colorfigura);
//paralelepípedo 
  pushMatrix();
  translate(posicionx[1], posiciony[1]);
  rotate(rotar[1]*PI/4);
  fill(colorr[1]);
  if(reflejo==true){
  quad(0,0,0,200,-100,300,-100,100);
  }else{
  scale(escala,escala2);
  quad(0,0,0,200,-100,300,-100,100);
  }popMatrix();
//cuadrado
  pushMatrix();
  translate(posicionx[2], posiciony[2]);
  rotate(rotar[2]*PI/4);
  fill(colorr[2]);
  quad(0,0,100,100,0,200,-100,100);
  popMatrix();
  //triangulo grande blanco
  pushMatrix();
  translate(posicionx[3], posiciony[3]);
  rotate(rotar[3]*PI/4);
  fill(colorr[3]);
  triangle(0,0,0,400,-200,200);
  popMatrix();
  //triangulo grande violeta
  pushMatrix();
  translate(posicionx[4], posiciony[4]);
  rotate(rotar[4]*PI/4);
  fill(colorr[4]);
  triangle(0,0,0,400,-200,200);
  popMatrix();
  //triangulo pequeño azul
  pushMatrix();
  translate(posicionx[5], posiciony[5]);
  rotate(rotar[5]*PI/4);
  fill(colorr[5]);
  triangle(0,0,100,100,0,200);
  popMatrix();
  //triangulo pequeño verde
  pushMatrix();
  translate(posicionx[6], posiciony[6]);
  rotate(rotar[6]*PI/4);
  fill(colorr[6]);
  triangle(0,0,100,100,0,200);
  popMatrix();
  //Triángulo mediano
  pushMatrix();
  translate(posicionx[7], posiciony[7]);
  rotate(rotar[7]*PI/4);
  fill(colorr[7]);
  triangle(0,0,0,200,200,0);
  popMatrix();
  //paralelepípedo
  if(mousePressed==true&&(colorfigura==-65536)&&traslapo==false){
    MoverPieza[1]=true;
    traslapo=true;
  }
  if(MoverPieza[1]){
    posicionx[1]=mouseX;
    posiciony[1]=mouseY;
  }
  //Cuadrado
  if(mousePressed==true&&(colorfigura==-256)&&traslapo==false){
    MoverPieza[2]=true;
    traslapo=true;
  }
  if(MoverPieza[2]){
    posicionx[2]=mouseX;
    posiciony[2]=mouseY;
  }
  //Triángulo blanco
  if(mousePressed==true&&(colorfigura==-1)&&traslapo==false){
    MoverPieza[3]=true;
    traslapo=true;
  }
  if(MoverPieza[3]){
    posicionx[3]=mouseX;
    posiciony[3]=mouseY;
  }
  //triángulo morado
  if(mousePressed==true&&(colorfigura==-65281)&&traslapo==false){
    MoverPieza[4]=true;
    traslapo=true;
  }
  if(MoverPieza[4]){
    posicionx[4]=mouseX;
    posiciony[4]=mouseY;
  }
  //triangulo pequeño azul
  if(mousePressed==true&&(colorfigura==-16776961)&&traslapo==false){
    MoverPieza[5]=true;
    traslapo=true;
  }
  if(MoverPieza[5]){
   posicionx[5]=mouseX;
   posiciony[5]=mouseY;
  }
  //triangulo verde
  if(mousePressed==true&&(colorfigura==-16711936)&&traslapo==false){
    MoverPieza[6]=true;
    traslapo=true;
  }
  if(MoverPieza[6]){
    posicionx[6]=mouseX;
    posiciony[6]=mouseY;
  }
  //triangulo mediano
  if(mousePressed==true&&(colorfigura==-16711681)&&traslapo==false){
    MoverPieza[7]=true;
    traslapo=true;
  }
  if(MoverPieza[7]){
    posicionx[7]=mouseX;
    posiciony[7]=mouseY;
  }
  loadPixels();
  int cuadros=0;
  for(int x=0; x<(width*height); x++){
    if(pixels[x]==-13605938){
      cuadros ++;
    }
  }
  updatePixels();
  if(cuadros<2100){
    textSize(32);
    text("¡Ganaste!", 10, 30); 
    fill(0, 102, 153); 
  }
}