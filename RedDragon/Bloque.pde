class Bloque extends GameObject{
  
  private Transform transform;
  private PImage imagen;
  
  public Bloque(PVector posicion){
    transform= new Transform(new PVector(posicion.x,posicion.y));
    imagen=loadImage("muro.png");
  }
  public void display(){
    imageMode(CORNER);
    image(imagen,this.transform.posicion.x,this.transform.posicion.y,100,400);
  }
  public void mover(){
  }
  
}
