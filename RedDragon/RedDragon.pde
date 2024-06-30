import ddf.minim.*;

Minim minim;
AudioPlayer audio;

private int estado;
private PantallaInicio p;
private PantallaJuego pj;
private GeneradorMuros sm;
private Dragon d;


public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  p= new PantallaInicio();
  sm= new GeneradorMuros();
  minim= new Minim(this);
  audio= minim.loadFile("musicaDeInicio.mp3");
  audio.play();
  d=new Dragon();
  sm.generarMuros();
  
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
  }
}
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){
    audio.pause();
    estado=MaquinaEstado.JUGANDO;
    pj= new PantallaJuego();
  }
  if(keyCode==SHIFT && estado==MaquinaEstado.JUGANDO){
    estado=MaquinaEstado.MENU;
    p= new PantallaInicio();
  }
}
public void mouseReleased(){
  
}
