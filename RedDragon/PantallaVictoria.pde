class PantallaVictoria extends Pantalla{
  private ImageComponent imageComponent;
  private Transform transform;
  private String mensaje;
  private PFont fuente;
  
  /*CREA LA PANTALLA DE VICTORIA*/
  public PantallaVictoria(){
    imageComponent= new ImageComponent("victoria.jpg");
    transform= new Transform(new PVector(width/2,height/2));
    this.ancho=width;
    this.alto=height;
    this.mensaje= "Presion SHIFT para salir";
    fuente= loadFont("Consolas-BoldItalic-60.vlw");
    
  }
  /*DIBUJA LA ´PANTALLA DE VICTORIA*/
  public void display(){
    imageMode(CENTER);
    imageComponent.displayImage(this.transform.posicion,this.ancho,this.alto);
  }
  /*MUESTRA MENSAJE PARA VOLVER AL INICIO*/
  public void mostrarMensaje(){
    textFont(fuente);
    textSize(30);
    fill(255);
    text(mensaje,0,height-20);
  }
}
