class PantallaInicio extends GameObject implements IDisplayable{
  
  private ImageComponent imageComponent;
  private String titulo,presioneEnter;//mensajes
  private PFont fuente;
  private color tinte,tinte2,tinte3,tinte4,tinte5; //valor de los colores
  private float velTransicionRojo,rojo,amarillo,velTransicionAmarillo;
  
  public PantallaInicio(){
    imageComponent= new ImageComponent("DragonRojo.jpg");
    fuente= loadFont("AgencyFB-Bold-48.vlw");
    titulo= "RED   DRAGON";
    presioneEnter="PRESIONE ENTER...";
    rojo=0;
    amarillo=255;
    tinte= color(#E37702);
    tinte2= color(#A50709);
    tinte3=color(rojo,0,0);
    tinte4= color(255,255,255);
    tinte5=color(0);
    ancho=width-100;
    alto=height;
    velTransicionRojo=40;
    velTransicionAmarillo=100;
  }
  public void display(){
    //IMAGEN DE FONDO
    background(0);
    imageMode(CORNER);
    imageComponent.displayImage(new PVector(50,0),this.ancho,this.alto);
    textFont(fuente);
    fill(tinte);
    //TITULO
    textSize(60);
    text(titulo,width/2+60,height/6);
    fill(tinte2);
    text(titulo,width/2-3+60,height/6-2);
    fill(tinte3);
    text(titulo,width/2-6+60,height/6-4);
    rojo+=velTransicionRojo*Time.getDeltaTime(frameRate);
    tinte3=color(rojo,0,0);
    if(rojo>=255||rojo<=0)
      velTransicionRojo*=-1;;
    //MENSAJE ENTER
    textSize(40);
    fill(tinte5);
    text(presioneEnter,30,height-30);
    fill(tinte4);
    text(presioneEnter,30-3,height-30-3);
    amarillo-=velTransicionAmarillo*Time.getDeltaTime(frameRate);
    tinte4=color(255,255,amarillo);
    if(amarillo<=0 || amarillo>=255)
      velTransicionAmarillo*=-1;
  }
}
