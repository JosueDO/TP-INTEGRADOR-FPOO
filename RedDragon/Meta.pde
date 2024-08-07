class Meta extends GameObject implements IDisplayable,IMoveable{
  private Transform transform;
  private ImageComponent imageComponent;
  private PVector velocidad;
  
  /*GENERA LA META CON UNA VELOCIDAD INICIAL PERO QUE NO SERA CONSTANTE*/
  public Meta(){
    this.transform= new Transform(new PVector(width,0));
    this.imageComponent= new ImageComponent("meta.png");
    this.velocidad= new PVector(40,0);
    this.ancho=230;
    this.alto=height;
  }
  
  @Override
  /*DIBUJA LA META*/
  public void display(){
    rectMode(CORNER);
    fill(255);
    rect(this.transform.posicion.x+75,this.transform.posicion.y,ancho-150,alto);
    imageMode(CORNER);
    imageComponent.displayImage(new PVector(this.transform.posicion.x,this.transform.posicion.y),ancho,alto);
  }
  /*MUEVE LA META*/
  public void move(){
    this.transform.posicion.x-=velocidad.x*Time.getDeltaTime(frameRate);
  }
}
