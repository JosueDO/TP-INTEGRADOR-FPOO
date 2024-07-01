class PantallaJuego extends GameObject implements IDisplayable{
  private PImage imagen,imagen2;
  private float i,k;// VARIABLES PARA CONTROLAR LAS NUBES
  
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
    //NUBES GRANDES
    image(imagen2,-k,0,ancho,alto);
    image(imagen2,ancho-k,0,ancho,alto);
    k+=0.5;
    if(k>=ancho)
      k=0;
    //NUBES CHICAS
    image(imagen,-i,0,ancho,alto);
    image(imagen,ancho-i,0,ancho,alto);
    noTint();
    i++;
    if(i>=ancho)
      i=0;
  }
}
