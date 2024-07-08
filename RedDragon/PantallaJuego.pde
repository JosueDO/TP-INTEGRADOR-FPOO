class PantallaJuego extends GameObject implements IDisplayable{
  
  private ImageComponent nubesGrandes,nubesChicas;
  private Transform transform,transform2;
  private PVector velocidad,velocidad2;
  
  public PantallaJuego(){
    nubesGrandes= new ImageComponent("fondo01.png");
    nubesChicas= new ImageComponent("fondo02.png");
    transform= new Transform(new PVector(0,0));
    transform2=new Transform(new PVector(0,0));
    this.velocidad= new PVector(50,0);
    this.velocidad2=new PVector(80,0);
    ancho=width;
    alto=height;
  }
  public void display(){
    background(#F78E0C);
    imageMode(CORNER);
    tint(#FC9B24);
    nubesGrandes.displayImage(new PVector(this.transform.posicion.x,this.transform.posicion.y),ancho,alto);
    nubesGrandes.displayImage(new PVector(this.transform.posicion.x+ancho,this.transform.posicion.y),ancho,alto);
    nubesChicas.displayImage(new PVector(this.transform2.posicion.x,this.transform2.posicion.y),ancho,alto);
    nubesChicas.displayImage(new PVector(this.transform2.posicion.x+ancho,this.transform2.posicion.y),ancho,alto);
   
    noTint();
  }
  public void mostrarPuntaje(Dragon dragon){
    fill(255,0,0);
    text((int)dragon.getPuntaje(),width/2,height/10);
  }
  public void move(){
    if(transform.posicion.x> -ancho){
      this.transform.posicion.x-=velocidad.x*Time.getDeltaTime(frameRate);
    }else{
      this.transform.posicion.x=0;
    }
   if(transform2.posicion.x> -ancho){
      this.transform2.posicion.x-=velocidad2.x*Time.getDeltaTime(frameRate);
    }else{
      this.transform2.posicion.x=0;
    }
  
}
 
}
