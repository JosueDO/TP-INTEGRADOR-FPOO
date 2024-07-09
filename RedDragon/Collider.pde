class Collider extends GameObject{
  private Transform transform;
  
  /*CREA COLISIONADOR TENIENDO EN CUENTA LA POSICION ESQUINA IZQUIERDA*/
  public Collider(PVector posicion,float ancho,float alto){
    this.transform= new Transform(new PVector(posicion.x,posicion.y));
    this.ancho=ancho;
    this.alto=alto;
  }
  
  /*VERIFICA SI HAY COLISION ENTRE 2 COLLIDERS*/
  public boolean verificarColision(Collider otroCollider){
    boolean colisiona = true;
    
    if(this.transform.posicion.x >= otroCollider.transform.getPosicion().x+otroCollider.getAncho()){
      colisiona = false;
    }
    if(this.transform.posicion.x + this.ancho <= otroCollider.transform.getPosicion().x){
      colisiona = false;
    }
    
    if(this.transform.posicion.y >= otroCollider.transform.getPosicion().y+otroCollider.getAlto()){
      colisiona = false;
    }
    
    if(this.transform.posicion.y + this.alto <= otroCollider.transform.getPosicion().y){
      colisiona = false;
    }
    
    return colisiona;
  }
}
