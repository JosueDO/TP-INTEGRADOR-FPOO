class GeneradorMuros implements IDisplayable{
  private ArrayList <Muro> muros;
  
  public GeneradorMuros(){
    muros= new ArrayList();
  }
  /*GENERA 2 MUROS A LA VEZ*/
  public void generarMuros(){
    float altoUno,altoDos;
    altoUno= random(0,300);
    altoDos=300-altoUno;
    muros.add(new Muro(new PVector(width,height-altoDos)));
    muros.add(new Muro(new PVector(width,height-altoDos-500)));
  }
  
  /*DIBUJA LOS MUROS*/
  public void display(){
    for(Muro m:muros){
      if(m!=null){
        m.display();
      }
    }
  }
  /*MUEVE LOS MUROS Y LOS ELIMINA SI LLEGAN AL BORDE*/
  public void move(){
    for(int i=0; i<muros.size();i++){
      if(muros.get(i)!=null){
        muros.get(i).move();
      }
      if(muros.get(i).transform.posicion.x<0){
        muros.remove(i);
      }  
    }
  }
  
  public ArrayList<Muro> getMuros(){
    return this.muros;
  }
}
