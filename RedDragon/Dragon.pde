class Dragon  extends GameObject implements IDisplayable{
  private Transform transform;
  private PVector velocidad;
  private SpriteDragon spriteDragon;
  private int estadoDragon;
  private int puntaje;
  
  public Dragon(){
    transform= new Transform(new PVector(width/4,height/6));
    spriteDragon= new SpriteDragon();
    estadoDragon= MaquinaEstadoDragon.CAYENDO;
    this.ancho=100;
    this.alto=100;
    this.puntaje=0;
    velocidad= new PVector(0,200);// VELOCIDAD DE CAIDA DEL DRAGON
  } 
  public void display(){
    imageMode(CORNER);
    //rectMode(CORNER);
    //rect(this.transform.posicion.x+20,this.transform.posicion.y+30,this.ancho-40,this.alto-60);
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
      this.setVelocidad(new PVector(0,250));
    }else if(this.estadoDragon==MaquinaEstadoDragon.CAYENDO){
      this.setVelocidad(new PVector(0,300));
    }
  }
 public void dragonPasoMuro(ArrayList<Muro> muros){
   for(Muro m:muros){
     if(m!=null){
       if(m.transform.getPosicion().x+m.getAncho()<=this.transform.posicion.x && !m.isSumado()){
          m.setSumado(true);
         this.puntaje++;
       }
     }
   }
 }
 public int getPuntaje(){
   return this.puntaje;
 }
}
