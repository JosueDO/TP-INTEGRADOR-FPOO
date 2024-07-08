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
private Meta meta;


public void setup(){
  size(800,500);
  estado=MaquinaEstado.MENU;
  pi= new PantallaInicio();
  minim= new Minim(this);
  audio= minim.loadFile("musicaDeInicio.mp3");
  audio.play();
  


}
public void draw(){
  
  if(estado==MaquinaEstado.MENU){
    pi.display();
    if(!audio.isPlaying()){
      audio.rewind();
      audio.play();
    }
  }
  
  if(estado==MaquinaEstado.JUGANDO){
    pj.display();
    pj.move();
    if(sm.isSinMuros()){
      meta.display();
      if(meta.transform.getPosicion().x>width-150)
         meta.move();
    }else{
      tiempoActual=millis();
      if (tiempoActual - tiempoInicial >= 3000){ // Actualizar cada 300 ms
         sm.generarMuros();
         tiempoInicial = tiempoActual;
         if(sm.isSinMuros()){
           meta=new Meta();
         }
       }
    }
    sm.display();
    pj.mostrarPuntaje(dragon);
    dragon.display();
    if(dragon.chocar(sm.getMuros()) || dragon.sobrepasarLimites()){
      estado= MaquinaEstado.PERDIENDO;
      pd= new PantallaDerrota();
      audio= minim.loadFile("SonidoDerrota.mp3");
      audio.play();
    }
    dragon.move();
    sm.move();
    dragon.dragonPasoMuro(sm.getMuros());//actualiza el puntaje en caso de pasar muros
    if(dragon.getPuntaje()==sm.getTotal()){
      println(dragon.getPuntaje());
      println(sm.getTotal());
      dragon.setEstadoDragon(MaquinaEstadoDragon.GANANDO);
      if(dragon.sobrepasarMeta()){
        estado=MaquinaEstado.VICTORIA;
      }
    }
    

  }
  if(estado==MaquinaEstado.PERDIENDO){
    pd.display();
    if(!audio.isPlaying()){
      audio.close();
      audio= minim.loadFile("musicaDeInicio.mp3");
      estado=MaquinaEstado.MENU;
      pi= new PantallaInicio();
    }
   
  }
  if(estado== MaquinaEstado.VICTORIA){
    
  }
}
/*ENTER PARA INICIAR EL JUEGO Y SHIFT PARA VOLVER A LA PANTALLA DE INICIO*/
public void keyReleased(){
  if(keyCode==ENTER && estado==MaquinaEstado.MENU){//PANTALLA INICIO
    audio.pause();
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
  if(mouseButton==LEFT && estado==MaquinaEstado.JUGANDO && dragon.estadoDragon!=MaquinaEstadoDragon.GANANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.VOLANDO);
  } 
}
public void mouseReleased(){
  if(mouseButton==LEFT && estado== MaquinaEstado.JUGANDO && dragon.estadoDragon!=MaquinaEstadoDragon.GANANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.CAYENDO);
  } 
}
