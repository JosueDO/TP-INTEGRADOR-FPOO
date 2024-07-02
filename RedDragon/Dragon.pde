class Dragon  extends GameObject implements IDisplayable{
  private Transform transform;
  private ImageComponent imageComponent;
  private int posFrameX,posFrameY,altoFrame,anchoFrame;
  private PVector velocidad;
  
  public Dragon(){
    transform= new Transform(new PVector(width/6*2,height/2));
    imageComponent= new ImageComponent("reddragonfly.png");
    posFrameX=0;
    posFrameY=0;
    anchoFrame=170;
    altoFrame=129;
    velocidad= new PVector(0,5);// VELOCIDAD DE CAIDA DEL DRAGON
  }
  
  public void display(){
    PImage frame = imageComponent.imagen.get(this.posFrameX,this.posFrameY,this.anchoFrame,this.altoFrame);
    //rectMode(CENTER);
    //rect(this.transform.posicion.x,this.transform.posicion.y,80,60);
    frame.resize(80,60);
    imageMode(CENTER);
    image(frame,this.transform.posicion.x,this.transform.posicion.y);
    if(this.posFrameX < imageComponent.imagen.width-this.anchoFrame-40){
      posFrameX+=this.anchoFrame+40;
    }else{
      posFrameX=0;
    }
  }
  public void move(){
    this.transform.setPosicion(new PVector(this.transform.posicion.x,this.transform.posicion.y+this.velocidad.y));
    velocidad= new PVector(0,5);
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
}
