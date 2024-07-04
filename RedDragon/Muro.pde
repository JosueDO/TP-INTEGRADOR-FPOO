class Muro extends GameObject implements IDisplayable{
  
  private Transform transform;
  private ImageComponent imageComponent;
  private PVector velocidad;
  
  public Muro(PVector posicion){
    transform= new Transform(new PVector(posicion.x,posicion.y));
    imageComponent= new ImageComponent("muro.png");
    this.ancho=100;
    this.alto=300;
    velocidad= new PVector(100,0);
  }
  public void display(){
    imageMode(CORNER);
    imageComponent.displayImage(new PVector(this.transform.posicion.x,this.transform.posicion.y),this.ancho,this.alto);
  }
  /*MUEVE LOS MUROS HORIZONTALMENTE A LA IZQUIERDA*/
  public void move(){
    this.transform.posicion.x-=this.velocidad.x*Time.getDeltaTime(frameRate);
  }
  
}
