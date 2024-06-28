class PantallaJuego{
  private PImage imagen,imagen2;
  private int i;
  private float k;
  
  public PantallaJuego(){
    imagen=loadImage("fondo02.png");
    imagen2=loadImage("fondo01.png");
    i=0;
    k=0;
  }
  public void display(){
    background(#009BD6);
    imageMode(CORNER);
    image(imagen2,0-k,0,width,height);
    image(imagen2,width-k,0,width,height);
    image(imagen,0-i,0,width,height);
    image(imagen,width-i,0,width,height);
   
    i++;
    k=k+0.5;
    if(abs(k)==width)
      k=0;
    if(abs(i)==width)
      i=0;
  }
}
