import ddf.minim.*;

private Minim minim;
private AudioPlayer audio;

private int estado;//ESTADO DE LA PANTALLA
private int tiempoActual,tiempoInicial;//CONTROLA EL TIEMPO DE APARACION DE MUROS
private PantallaInicio pi;
private PantallaJuego pj;
private PantallaDerrota pd;
private PantallaVictoria pv;
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
  
  /* SE EJECUTA CADA VEZ QUE SE INICIA EL JUEGO O SE VUELVE A LA PANTALLA DE INICIO, MUESTRA IMAGEN Y MUSICA*/
  if(estado==MaquinaEstado.MENU){
    pi.display();
    if(!audio.isPlaying()){//REINICIA LA MUSICA SI TERMINA
      audio.rewind();
      audio.play();
    }
  }
  
  /* SE EJECUTA CUANDO EMPIEZA EL JUEGO, GENERA MUROS, EL DRAGON Y LA LOS SONIDOS*/
  if(estado==MaquinaEstado.JUGANDO){
    pj.display();
    pj.move();
    if(sm.isSinMuros()){//SI YA NO HAY MUROS APARECERA LA META
      meta.display();
      if(meta.transform.getPosicion().x>width-150)//DETIENE LA META
         meta.move();
    }else{//SI HAY MUROS GENERARA LOS MUROS CADA CIERTO TIEMPO
      tiempoActual=millis();
      if (tiempoActual - tiempoInicial >= 3000){ // Actualizar cada 3000 ms
         sm.generarMuros();
         tiempoInicial = tiempoActual;
         if(sm.isSinMuros()){//SIRVE PARA GENERAR POR UNICA VEZ LA META
           meta=new Meta();
         }
       }
    }
    sm.display();
    pj.mostrarPuntaje(dragon);//MUESTRA EL PUNTAJE
    dragon.display();
    if(dragon.chocar(sm.getMuros()) || dragon.sobrepasarLimites()){//EVALUA SI EL DRAGON CHOCA O SI SE SALE DE LOS LIMITES EN "Y" PARA ASIGNAR EL ESTADO DE DERROTA
      estado= MaquinaEstado.PERDIENDO;
      pd= new PantallaDerrota();
      audio= minim.loadFile("SonidoDerrota.mp3");// SE EJECUTA SONIDO DE DERROTA
      audio.play();
      
    }
    dragon.move();
    sm.move();
    if(dragon.actualizarPuntaje(sm.getMuros())){//ACTUALIZA PUNTAJE CADA VEZ QUE SOBREPASA MUROS Y GENERA UN SONIDO
      audio= minim.loadFile("sonidoMoneda.mp3");
      audio.play();
    }
    if(dragon.getPuntaje()==sm.getTotal()){// EVALUA SI EL TOTAL DE PARES DE MUROS COINCIDE CON EL PUNTAJE PARA SABER SI GANO EL JUEGO
      dragon.setEstadoDragon(MaquinaEstadoDragon.GANANDO);//ASIGNA UN ESTADO AL DRAGON DE VICTORIA Y SONIDO
      if(!audio.isPlaying()){
         audio= minim.loadFile("rugidoDragon.mp3");
         audio.play();
       }
      if(dragon.sobrepasarMeta()){//SI SOBREPASA LA META CUANDO YA ENTRO EN ESTADO DE VICTORIA APARECERA LA PANTALLA DE VICTORIA
        audio.close();
        estado=MaquinaEstado.VICTORIA;
        pv= new PantallaVictoria();
        audio= minim.loadFile("sonidoVictoria.mp3");//SE EJECUTA SONIDO DE VICTORIA
        audio.play();
      }
    }
  }
  
  /*SE EJECUTA SI SE PERDIO EL JUEGO, DURANTE EL TIEMPO QUE DURE EL SONIDO DE DERROTA, DESPUES REDIRIGE AL INICIO*/
  if(estado==MaquinaEstado.PERDIENDO){
    pd.display();
    if(!audio.isPlaying()){//ASIGNA ESTADO DE PANTALLA Y MUSICA DE INICIO
      audio.close();
      audio= minim.loadFile("musicaDeInicio.mp3");
      estado=MaquinaEstado.MENU;
      pi= new PantallaInicio();
    }
  }
  
  /*SE EJECUTA CUANDO EL DRAGON PASA LA META Y GANA EL JUEGO*/
  if(estado== MaquinaEstado.VICTORIA){
    pv.display();
    if(!audio.isPlaying()){
      audio.close();
      pv.mostrarMensaje();
    }
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
  if(keyCode==SHIFT && estado==MaquinaEstado.VICTORIA){//SI SE ENCUENTRA EN PANTALLA DE VICTORIA Y SE APRETA SHIFT VUELVE AL INICIO
    estado=MaquinaEstado.MENU;
    pi= new PantallaInicio();
    audio.close();
    audio= minim.loadFile("musicaDeInicio.mp3");
  }
}
/*EL DRAGON VUELA CON CLICK IZQUIERDO*/
public void mousePressed(){//ESTADO DRAGON VOLANDO
  if(mouseButton==LEFT && estado==MaquinaEstado.JUGANDO && dragon.estadoDragon!=MaquinaEstadoDragon.GANANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.VOLANDO);
  } 
}
public void mouseReleased(){//ESTADO DRAGON CAYENDO
  if(mouseButton==LEFT && estado== MaquinaEstado.JUGANDO && dragon.estadoDragon!=MaquinaEstadoDragon.GANANDO){
    dragon.setEstadoDragon(MaquinaEstadoDragon.CAYENDO);
  } 
}
