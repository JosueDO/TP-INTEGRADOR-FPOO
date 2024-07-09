class GeneradorMuros implements IDisplayable {
  private ArrayList <Muro> muros;
  private int i,total;

  public GeneradorMuros() {
    muros= new ArrayList();
    total=5;//CANTIDAD TOTAL DE PARES DE MUROS
    i=total*2;//VARIABLE PARA CONTROLAR LA CANTIDAD DE MUROS A GENERAR
  }
  /*GENERA 2 MUROS A LA VEZ*/
  public void generarMuros() {
    if (i>0) {
      float altoUno, altoDos;
      altoUno= random(0, 300);
      altoDos=300-altoUno;
      muros.add(new Muro(new PVector(width, height-altoDos)));
      muros.add(new Muro(new PVector(width, height-altoDos-500)));
      i-=2;
    }else {
      println("NO HAY MAS MUROS");
    }
  }

  /*DIBUJA LOS MUROS*/
  public void display() {
    for (Muro m : muros) {
      if (m!=null) {
        m.display();
      }
    }
  }
  /*MUEVE LOS MUROS Y LOS ELIMINA SI LLEGAN AL BORDE*/
  public void move() {
    for (int i=0; i<muros.size(); i++) {
      if (muros.get(i)!=null) {
        muros.get(i).move();
      }
    }
    if(muros.size()>0){
      if(muros.get(0).transform.posicion.x<-50){
        muros.remove(1);
        muros.remove(0);
      }
    }
  }

  public ArrayList<Muro> getMuros() {
    return this.muros;
  }
  public boolean isSinMuros(){
  return i==0;
  }
  public int getTotal(){
    return this.total;
  }
}
