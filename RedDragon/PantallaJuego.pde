class PantallaJuego extends GameObject implements IDisplayable{
  
  private ImageComponent imageComponent,imageComponent2;
  private float i,k;// VARIABLES PARA CONTROLAR LAS NUBES
  
  public PantallaJuego(){
    imageComponent= new ImageComponent("fondo02.png");
    imageComponent2= new ImageComponent("fondo01.png");
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
    imageComponent2.displayImage(new PVector(-k,0),this.ancho,this.alto);
    imageComponent2.displayImage(new PVector(this.ancho-k,0),this.ancho,this.alto);
    k+=0.5;
    if(k>=ancho)
      k=0;
    //NUBES CHICAS
    imageComponent.displayImage(new PVector(-i,0),this.ancho,this.alto);
    imageComponent.displayImage(new PVector(this.ancho-i,0),this.ancho,this.alto);
    i++;
    if(i>=ancho)
      i=0;
    noTint();
  }
}
