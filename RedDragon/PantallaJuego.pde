class PantallaJuego extends GameObject{
  private PImage imagen,imagen2;
  private float i,k;
  
  public PantallaJuego(){
    imagen=loadImage("fondo02.png");
    imagen2=loadImage("fondo01.png");
    i=0;
    k=0;
    ancho=width;
    alto=height;
  }
  public void display(){
    background(#F78E0C);
    imageMode(CORNER);
    tint(#FC9B24);
    image(imagen2,-k,0,ancho,alto);
    image(imagen2,ancho-k,0,ancho,alto);
    image(imagen,-i,0,ancho,alto);
    image(imagen,ancho-i,0,ancho,alto);
    noTint();
    k+=0.5;
    i++;
    if(i>=ancho)
      i=0;
    if(k>=ancho)
      k=0;
  }
}
