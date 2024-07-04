class Dragon  extends GameObject implements IDisplayable{
  private Transform transform;
  private PVector velocidad;
  private SpriteDragon spriteDragon;
  private int estadoDragon;
  
  public Dragon(){
    transform= new Transform(new PVector(width/2,height/5));
    spriteDragon= new SpriteDragon();
    estadoDragon= MaquinaEstadoDragon.CAYENDO;
    this.ancho=100;
    this.alto=100;
    velocidad= new PVector(0,200);// VELOCIDAD DE CAIDA DEL DRAGON
  } 
  public void display(){
    imageMode(CENTER);
    rectMode(CENTER);
    rect(this.transform.posicion.x,this.transform.posicion.y,this.ancho-30,this.alto-50);
    spriteDragon.renderDragon(estadoDragon,this.transform.posicion,this.ancho,this.alto);
  }
  public void move(){
    switch(estadoDragon){
      case MaquinaEstadoDragon.CAYENDO:
      this.transform.setPosicion(new PVector(this.transform.posicion.x,this.transform.posicion.y+this.velocidad.y*Time.getDeltaTime(frameRate)));
      break;
      case MaquinaEstadoDragon.VOLANDO:
      this.transform.setPosicion(new PVector(this.transform.posicion.x,this.transform.posicion.y-this.velocidad.y*Time.getDeltaTime(frameRate)));
      break;
    }
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
  
  public void setEstadoDragon(int estadoDragon){
    this.estadoDragon=estadoDragon;
    if(this.estadoDragon==MaquinaEstadoDragon.VOLANDO){
      this.setVelocidad(new PVector(0,300));
    }else if(this.estadoDragon==MaquinaEstadoDragon.CAYENDO){
      this.setVelocidad(new PVector(0,300));
    }
  }
}
