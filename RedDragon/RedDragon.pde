import ddf.minim.*;

Minim minim;
AudioPlayer audio;
AudioPlayer audioDerrota;

private int estado;
private int tiempoActual,tiempoInicial;//CONTROLA EL TIEMPO DE APARACION DE MUROS
private PantallaInicio pi;
private PantallaJuego pj;
private PantallaDerrota pd;
private GeneradorMuros sm;
private Dragon dragon;


public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  pi= new PantallaInicio();
  minim= new Minim(this);
  audio= minim.loadFile("SonidoDerrota.mp3");
  audio.play();
  pd= new PantallaDerrota();

}
public void draw(){
  if(estado==MaquinaEstado.MENU){
    pi.display();
    if(!audio.isPlaying()){
      audio.rewind();
      audio.play();
    }
  }
  if(estado==MaquinaEstado.JUGANDO && estado!=MaquinaEstado.PERDIENDO){
    
    
    pj.display();
    pj.move();
    sm.display();
    pj.mostrarPuntaje(dragon);
    dragon.display();
    if(dragon.chocar(sm.getMuros())){
      estado= MaquinaEstado.PERDIENDO;

      minim= new Minim(this);
      audio= minim.loadFile("derrota.mp3");
      audio.play();
    }
    dragon.move();
    sm.move();
  
    dragon.dragonPasoMuro(sm.getMuros());
    tiempoActual=millis();
    if (tiempoActual - tiempoInicial >= 3000) {  // Actualizar cada 300 ms
    sm.generarMuros();
    tiempoInicial = tiempoActual;
    }
  }
  if(estado==MaquinaEstado.PERDIENDO){
    pd.display();
   
  }
}
/*ENTER PARA INICIAR EL JUEGO Y SHIFT PARA VOLVER A LA PANTALLA DE INICIO*/
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){//PANTALLA INICIO
    audio.pause();
    audio.rewind();
    estado=MaquinaEstado.JUGANDO;
    dragon=new Dragon();
    pj= new PantallaJuego();
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
