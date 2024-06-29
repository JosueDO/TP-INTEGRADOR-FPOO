class Transform{
  private PVector posicion;
  
  public Transform(PVector posicion){
    this.posicion=posicion;
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  }
}
