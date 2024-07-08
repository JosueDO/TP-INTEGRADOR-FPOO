class Muro extends GameObject implements IDisplayable{
  
  private Transform transform;
  private ImageComponent imageComponent;
  private PVector velocidad;
  private boolean sumado;
  private Collider collider;
  
  public Muro(PVector posicion){
    transform= new Transform(new PVector(posicion.x,posicion.y));
    imageComponent= new ImageComponent("muro.png");
    this.ancho=100;
    this.alto=300;
    velocidad= new PVector(200,0);
    sumado= false;
    collider= new Collider(new PVector(this.transform.posicion.x,this.transform.posicion.y),this.ancho,this.alto);
  }
  public void display(){
    imageMode(CORNER);
    rectMode(CORNER);
    rect(this.transform.posicion.x,this.transform.posicion.y,this.ancho,this.alto);
    imageComponent.displayImage(new PVector(this.transform.posicion.x,this.transform.posicion.y),this.ancho,this.alto);
  }
  /*MUEVE LOS MUROS HORIZONTALMENTE A LA IZQUIERDA*/
  public void move(){
    this.transform.posicion.x-=this.velocidad.x*Time.getDeltaTime(frameRate);
    this.collider.transform.setPosicion(new PVector(this.transform.posicion.x,this.transform.posicion.y));
  }
  public boolean isSumado(){
    return sumado;
  }
  public void setSumado(boolean sumado){
    this.sumado=sumado;
  }
  public Collider getCollider(){
    return this.collider;
  }
}
