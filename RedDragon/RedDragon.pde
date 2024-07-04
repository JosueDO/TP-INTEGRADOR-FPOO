import ddf.minim.*;

Minim minim;
AudioPlayer audio;

private int estado;
private int tiempoActual,tiempoInicial;//CONTROLA EL TIEMPO DE APARACION DE MUROS
private PantallaInicio pi;
private PantallaJuego pj;
private GeneradorMuros sm;
private Dragon dragon;


public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  pi= new PantallaInicio();
  minim= new Minim(this);
  audio= minim.loadFile("musicaDeInicio.mp3");

}
public void draw(){
  if(estado==MaquinaEstado.MENU){
    pi.display();
    if(!audio.isPlaying()){
      audio= minim.loadFile("musicaDeInicio.mp3");
      audio.play();
    }
  }
  if(estado==MaquinaEstado.JUGANDO){
    
    pj.display();
    pj.move();
    sm.display();
    sm.move();
    dragon.display();
    dragon.move();
    tiempoActual=millis();
    if (tiempoActual - tiempoInicial >= 3000) {  // Actualizar cada 300 ms
    sm.generarMuros();
    tiempoInicial = tiempoActual;
    }
  }
}
/*ENTER PARA INICIAR EL JUEGO Y SHIFT PARA VOLVER A LA PANTALLA DE INICIO*/
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){//PANTALLA INICIO
    audio.pause();
    estado=MaquinaEstado.JUGANDO;
    dragon=new Dragon();
    pj= new PantallaJuego(new PVector(0,0));
    tiempoInicial=millis();
    sm= new GeneradorMuros();
  }
  if(keyCode==SHIFT && estado==MaquinaEstado.JUGANDO){//PANTALLA DE JUEGO
    estado=MaquinaEstado.MENU;
    pi= new PantallaInicio();
  }
}
/*EL DRAGON VUELA CON CLICK IZQUIERDO*/
public void mousePressed(){
  if(mouseButton==LEFT && estado==MaquinaEstado.JUGANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.VOLANDO);
  } 
}
public void mouseReleased(){
  if(mouseButton==LEFT && estado== MaquinaEstado.JUGANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.CAYENDO);
  } 
}
