class PantallaDerrota extends GameObject{
  private ImageComponent imageComponent;
  private String derrota;
  private PFont fuente;
  private Transform transform;
  
  public PantallaDerrota(){
    imageComponent= new ImageComponent("derrota.jpg");
    derrota= "DERROTA";
    fuente= loadFont("Consolas-BoldItalic-60.vlw");
    transform= new Transform(new PVector(width/2,height/2));
    this.ancho=width;
    this.alto=height;
  }
  
  public void display(){
    textFont(fuente);
    imageMode(CORNER);
    imageComponent.displayImage(this.transform.posicion,width,height);
    textSize(50);
    text(derrota,width/2,height*6/7);
  }
}
