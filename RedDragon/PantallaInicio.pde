class PantallaInicio{
  private float alto,ancho;
  private PImage imagen;
  private String titulo,mensaje,mensaje2;
  private PFont fuente;
  private color tinte,tinte2,tinte3,tinte4,tinte5;
  private int i,i2,rojo;
  
  public PantallaInicio(){
    imagen=loadImage("DragonRojo.jpg");
    fuente= loadFont("AgencyFB-Bold-48.vlw");
    titulo= "RED   DRAGON";
    mensaje="PRESIONE ENTER...";
    tinte= color(#E37702);
    tinte2= color(#A50709);
    rojo=0;
    tinte3=color(rojo,0,0);
    tinte4= color(255);
    tinte5=color(0);
    i=3;
    i2=1;
    mensaje2="HIGHSCORE: ";
  }
  public void display(){
    background(0);
    imageMode(CORNER);
    image(imagen,50,0,width-100,height);
    textFont(fuente);
    fill(tinte);
    textSize(60);
    text(titulo,width/2+60,height/6);
    fill(tinte2);
    text(titulo,width/2-3+60,height/6-3);
    fill(tinte3);
    text(titulo,width/2-6+60,height/6-6);
    rojo+=i2;
    tinte3=color(rojo,0,0);
    if(rojo==255||rojo==0)
      i2*=-1;;
    textSize(40);
    fill(tinte5);
    text(mensaje,30,height-30);
    fill(tinte4);
    text(mensaje,30-3,height-30-3);
    tinte4-=i;
    if(tinte4==0 || tinte4==255)
      i*=-1;
    textSize(30);
    fill(0);
    text(mensaje2,30-3,30-3);
    fill(255);
    text(mensaje2,30,30);
    
  }
}
