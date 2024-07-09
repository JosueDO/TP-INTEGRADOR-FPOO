class PantallaVictoria extends GameObject{
  private ImageComponent imageComponent;
  private Transform transform;
  private String mensaje;
  private PFont fuente;
  public PantallaVictoria(){
    imageComponent= new ImageComponent("victoria.jpg");
    transform= new Transform(new PVector(width/2,height/2));
    this.ancho=width;
    this.alto=height;
    this.mensaje= "Presion SHIFT para salir";
    fuente= loadFont("Consolas-BoldItalic-60.vlw");
    
  }
  public void display(){
    imageMode(CENTER);
    imageComponent.displayImage(this.transform.posicion,this.ancho,this.alto);
  }
  public void mostrarMensaje(){
    textFont(fuente);
    textSize(30);
    fill(255);
    text(mensaje,0,height-20);
  }
}
