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
    background(#F78E0C);
    imageMode(CORNER);
    tint(#FC9B24);
    image(imagen2,0-k,0,width,height);
    image(imagen2,width-k,0,width,height);
    image(imagen,0-i,0,width,height);
    image(imagen,width-i,0,width,height);
    noTint();
   
    i++;
    k=k+0.5;
    if(abs(k)==width)
      k=0;
    if(abs(i)==width)
      i=0;
  }
}
