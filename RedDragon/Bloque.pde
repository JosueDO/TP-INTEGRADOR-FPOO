class Muro extends GameObject{
  
  private Transform transform;
  private PImage imagen;
  private PVector velocidad;
  
  public Muro(PVector posicion){
    transform= new Transform(new PVector(posicion.x,posicion.y));
    imagen=loadImage("muro.png");
    this.ancho=100;
    velocidad= new PVector(3,0);
    println("----");
  }
  public void display(){
    imageMode(CORNER);
    image(imagen,this.transform.posicion.x,this.transform.posicion.y,100,300);
  }
  public void move(){
    this.transform.posicion.x-=this.velocidad.x;
  }
  
}
