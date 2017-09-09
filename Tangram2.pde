boolean traslapo, reflejo=true, ganar=false,espacio=false,fin=false;
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
posiciony[2]=140;
posiciony[3]=250;
posiciony[4]=100;
posiciony[5]=50;
posiciony[6]=140;
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
  if (key==' '){
    espacio=true;
  }
}
//traslapo
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
  textSize(20);
    fill(255,255,255);
    text("Instrucciones", 10, 30); 
    text("Para mover cualquier figura, arrástrela con el mouse.", 10, 50);  
    text("Para girar las figura en sentido horario, utilice la flecha ←", 10, 70);
    text("Para girar las figura en sentido antihorario, utilice la flecha →", 10, 90);
    text("Para voltear el paralelepípedo, utilice la flecha ↑", 10, 110); 
  fill(48,99,206);
  rect(475,145,400,400);
  println(mouseX,mouseY);
  //Nivel dos, está acá arriba para que las piezas no se borren
  if(ganar==true&&espacio==true){
    background(90);
    fill(48,99,206);
  pushMatrix();
    noStroke();
    translate(1000,51);
    rotate(PI/4);
    quad(0,0,0,200,-100,300,-100,100);
  popMatrix();
  pushMatrix();
    noStroke();
    translate(717,191);
    rotate(-PI/4);
    quad(0,0,100,100,0,200,-100,100);
  popMatrix();
  pushMatrix();
    translate(435,50);
    rotate(-PI/4);
    triangle(0,0,0,400,-200,200);
  popMatrix();
  pushMatrix();
    translate(317,332);
    rotate(-PI/2);
    triangle(0,0,0,400,-200,200);
  popMatrix();
  pushMatrix();
    noStroke();
    translate(1000,250);
    rotate(PI);
    triangle(0,0,100,100,0,200);
  popMatrix();
  pushMatrix();
    translate(717, 473);
    rotate(5*PI/4);
    triangle(0,0,100,100,0,200);
  popMatrix();
  pushMatrix();
    translate(717,531);
    rotate(PI);
    triangle(0,0,0,200,200,0);
  popMatrix();
  if(key==' '&&get(652,211)==-10855846){
  fin=true;
  }
  
  }
//paralelepípedo 
  pushMatrix();
      noStroke();
  translate(posicionx[1], posiciony[1]);
  rotate(rotar[1]*PI/4);
  fill(colorr[1]);
  if(reflejo==true){
  quad(0,0,0,200,-100,300,-100,100);
  }else{
     scale(escala,escala2);
     quad(0,0,0,200,-100,300,-100,100);
   }
  popMatrix();
//cuadrado
  pushMatrix();
      noStroke();
  translate(posicionx[2], posiciony[2]);
  rotate(rotar[2]*PI/4);
  fill(colorr[2]);
  quad(0,0,100,100,0,200,-100,100);
  popMatrix();
  //triangulo grande blanco
  pushMatrix();
      noStroke();
  translate(posicionx[3], posiciony[3]);
  rotate(rotar[3]*PI/4);
  fill(colorr[3]);
  triangle(0,0,0,400,-200,200);
  popMatrix();
  //triangulo grande violeta
  pushMatrix();
      noStroke();
  translate(posicionx[4], posiciony[4]);
  rotate(rotar[4]*PI/4);
  fill(colorr[4]);
  triangle(0,0,0,400,-200,200);
  popMatrix();
  //triangulo pequeño azul
  pushMatrix();
      noStroke();
  translate(posicionx[5], posiciony[5]);
  rotate(rotar[5]*PI/4);
  fill(colorr[5]);
  triangle(0,0,100,100,0,200);
  popMatrix();
  //triangulo pequeño verde
  pushMatrix();
      noStroke();
  translate(posicionx[6], posiciony[6]);
  rotate(rotar[6]*PI/4);
  fill(colorr[6]);
  triangle(0,0,100,100,0,200);
  popMatrix();
  //Triángulo mediano
  pushMatrix();
      noStroke();
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
  //lectura de pixeles para saber si ganó
  loadPixels();
  int cuadros=0;
  for(int x=0; x<(width*height); x++){
    if(pixels[x]==-13605938){
      cuadros ++;
    }
  }
  updatePixels();
  if(cuadros<2000){
    ganar=true;
    textSize(32);
    text("¡Ganaste!", 700, 30); 
    text("¡Presiona espacio para continuar!", 700, 60); 
    fill(0, 102, 153); 
  }//termina el programa en el segundo nivel
  if(key==' '&&get(652,211)==-10855846&&fin==true){
   background(90);
  fill(0,0,0);
  textSize(100);
  text("Felicitaciones", 400,400); 
  }
}