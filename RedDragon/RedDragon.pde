import ddf.minim.*;

Minim minim;
AudioPlayer audio;

private int estado;
private PantallaInicio p;
private PantallaJuego pj;
private Bloque bloque;




public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  p= new PantallaInicio();
  bloque= new Bloque(new PVector(width-100,0));
  minim= new Minim(this);
  audio= minim.loadFile("musicaDeInicio.mp3");
  audio.play();
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
    bloque.display();
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
