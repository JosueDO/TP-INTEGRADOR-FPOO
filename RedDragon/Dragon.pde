class Dragon  extends GameObject implements IDisplayable,IMoveable{
  private Transform transform;
  private PVector velocidad;
  private SpriteDragon spriteDragon;
  private int estadoDragon;
  private float puntaje;
  private Collider collider;
  
  public Dragon(){
    transform= new Transform(new PVector(width/4,height/6));
    spriteDragon= new SpriteDragon();
    estadoDragon= MaquinaEstadoDragon.CAYENDO;
    this.ancho=100;
    this.alto=100;
    this.puntaje=0;
    velocidad= new PVector(0,200);// VELOCIDAD DE CAIDA DEL DRAGON
    collider= new Collider(new PVector(this.transform.posicion.x+20,this.transform.posicion.y+30),this.ancho-35,this.alto-60);
  } 
  public void display(){
    imageMode(CORNER);
    //rectMode(CORNER);
    //rect(this.collider.transform.posicion.x,this.collider.transform.posicion.y,this.collider.getAncho(),this.collider.getAlto());
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
      case MaquinaEstadoDragon.GANANDO:
      this.transform.setPosicion(new PVector(this.transform.posicion.x+this.velocidad.x*Time.getDeltaTime(frameRate),this.transform.posicion.y));
      break;
    }
    this.collider.transform.setPosicion(new PVector(this.transform.posicion.x+15,this.transform.posicion.y+30));
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
    }else if(this.estadoDragon==MaquinaEstadoDragon.GANANDO){
      this.setVelocidad(new PVector(150,0));
    }
  }
 public boolean actualizarPuntaje(ArrayList<Muro> muros){
   int x=0;
   for(Muro m:muros){
     if(m!=null){
       if(m.transform.getPosicion().x+m.getAncho()-40<=this.transform.posicion.x && !m.isSumado()){
          m.setSumado(true);
         this.puntaje+=0.5;
         x++;
       }
     }
   }
   return x==2;
 }
 public boolean chocar(ArrayList<Muro> muros){
   boolean isCollide=false;
   for (Muro m:muros){
     if(m!=null){
       isCollide=this.collider.verificarColision(m.getCollider());
       if(isCollide){
         return true;
       }
     }
   }
   return false;
 }
 public boolean sobrepasarLimites(){
   return this.transform.posicion.y>=height || this.transform.posicion.y+this.alto<=0;
 }
 public boolean sobrepasarMeta(){
   return this.transform.posicion.x>=width;
 }
 public float getPuntaje(){
   return this.puntaje;
 }
}
