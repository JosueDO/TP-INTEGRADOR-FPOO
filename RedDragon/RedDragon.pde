import ddf.minim.*;

Minim minim;
AudioPlayer audio;

private int estado;
private int tiempoActual,tiempoInicial;
private PantallaInicio p;
private PantallaJuego pj;
private GeneradorMuros sm;
private Dragon d;


public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  p= new PantallaInicio();
  minim= new Minim(this);
  audio= minim.loadFile("musicaDeInicio.mp3");
  d=new Dragon();
  frameRate(60);
}
public void draw(){
  if(estado==MaquinaEstado.MENU){
    p.display();
    if(!audio.isPlaying()){
      audio= minim.loadFile("musicaDeInicio.mp3");
      audio.play();
    }
  }
  if(estado==MaquinaEstado.JUGANDO){
  
    pj.display();
    sm.display();
    sm.move();
    d.display();
    tiempoActual=millis();
    if (tiempoActual - tiempoInicial >= 3000) {  // Actualizar cada 300 ms
    sm.generarMuros();
    tiempoInicial = tiempoActual;
    }
  }
}
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){
    audio.pause();
    estado=MaquinaEstado.JUGANDO;
    pj= new PantallaJuego();
    tiempoInicial=millis();
    sm= new GeneradorMuros();
  }
  if(keyCode==SHIFT && estado==MaquinaEstado.JUGANDO){
    estado=MaquinaEstado.MENU;
    p= new PantallaInicio();
  }
}
public void mouseReleased(){
  
}
