class GeneradorMuros{
  private ArrayList <Muro> muros;
  public GeneradorMuros(){
    muros= new ArrayList();
  }
  public void generarMuros(){
    float altoUno,altoDos;
    altoUno= random(0,300);
    altoDos=300-altoUno;
    muros.add(new Muro(new PVector(width,height-altoDos)));
    muros.add(new Muro(new PVector(width,height-altoDos-500)));
  }
  public void display(){
    for(Muro m:muros){
      if(m!=null){
        m.display();
      }
    }
  }
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
}
