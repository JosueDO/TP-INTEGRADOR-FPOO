class PantallaDerrota extends GameObject{
  private ImageComponent imageComponent;
  private String derrota;
  private PFont fuente;
  private Transform transform;
  private float velTransicionNegro,negro;
  private color tinteNegro;
  
  public PantallaDerrota(){
    imageComponent= new ImageComponent("derrota.jpg");
    derrota= "DERROTA";
    fuente= loadFont("Consolas-BoldItalic-60.vlw");
    transform= new Transform(new PVector(width/2,height/2));
    this.ancho=width;
    this.alto=height;
    negro=0;
    tinteNegro=color(negro);
    velTransicionNegro=15;
  }
  
  public void display(){
    textFont(fuente);
    tint(tinteNegro);
    if(negro<255)
      negro+=velTransicionNegro*Time.getDeltaTime(frameRate);
    tinteNegro=color(negro);
    imageMode(CENTER);
    imageComponent.displayImage(this.transform.posicion,width,height);
    fill(negro);
    textSize(60);
    text(derrota,width/2-120,height*6/7);
    noTint();
  }
}
