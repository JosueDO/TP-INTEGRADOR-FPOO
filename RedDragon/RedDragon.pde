private int estado;
private PantallaInicio p;
private PantallaJuego pj;



public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  p= new PantallaInicio();

}
public void draw(){
  if(estado==MaquinaEstado.MENU){
    p.display();
  }
  if(estado==MaquinaEstado.JUGANDO){
    pj.display();
  }
}
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){
    estado=MaquinaEstado.JUGANDO;
    pj= new PantallaJuego();
  }
  if(keyCode==SHIFT && estado==MaquinaEstado.JUGANDO){
    estado=MaquinaEstado.MENU;
    p= new PantallaInicio();
  }
}
