private int estado;
private PantallaInicio p;

public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  p= new PantallaInicio();
}
public void draw(){
  if(estado==MaquinaEstado.MENU){
    p.display();
  }
}
public void keyPressed(){
}
