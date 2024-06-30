class Dragon  extends GameObject{
  private Transform transform;
  private PImage imagen;
  private int posFrameX,posFrameY,altoFrame,anchoFrame;
  
  public Dragon(){
    transform= new Transform(new PVector(width/6*2,height/2));
    imagen= loadImage("reddragonfly.png");
    posFrameX=0;
    posFrameY=0;
    anchoFrame=170;
    altoFrame=129;
  }
  
  public void display(){
    PImage frame = imagen.get(this.posFrameX,this.posFrameY,this.anchoFrame,this.altoFrame);
    //rectMode(CENTER);
    //rect(this.transform.posicion.x,this.transform.posicion.y,80,60);
    frame.resize(80,60);
    imageMode(CENTER);
    image(frame,this.transform.posicion.x,this.transform.posicion.y);
    if(this.posFrameX < imagen.width-this.anchoFrame-40){
      posFrameX+=this.anchoFrame+40;
    }else{
      posFrameX=0;
    }
  }
}
