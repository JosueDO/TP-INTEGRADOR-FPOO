class SpriteDragon{
  private int xFrame, yFrame;
  private float xFrameFloat, nextXFrameFloat,velTransicion;
  private int widthFrame, heightFrame;
  private ImageComponent sprite;
  
  public SpriteDragon(){
    this.sprite = new ImageComponent("reddragonfly.png");
    this.widthFrame=205;
    this.heightFrame=161;
    this.xFrame=0;
    this.yFrame=0;
    this.xFrameFloat=0;
    this.nextXFrameFloat=widthFrame;
    this.velTransicion=0;
  }
  
  public void renderDragon(int estadoDragon,PVector posicion,float ancho,float alto){
    PImage imagen;
    switch(estadoDragon){
      case MaquinaEstadoDragon.CAYENDO:
        yFrame= heightFrame;
        this.velTransicion=10;//VELOCIDAD DE TRANSICION DE SPRITES
        imagen= sprite.imagen.get(this.xFrame, yFrame, widthFrame, heightFrame);
        imagen.resize((int)ancho,(int)alto);
        image(imagen, posicion.x, posicion.y);
        xFrameFloat+=(widthFrame*velTransicion*Time.getDeltaTime(frameRate));
        if (xFrameFloat>=nextXFrameFloat) {
          this.xFrame+=this.widthFrame;
          nextXFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame>=this.sprite.imagen.width) {
            this.xFrame=0;
            this.xFrameFloat=0;
            this.nextXFrameFloat=this.widthFrame;
          }
        }
      break;
      
      case MaquinaEstadoDragon.VOLANDO:
        yFrame=0;
        this.velTransicion=20;
        imagen= sprite.imagen.get(this.xFrame, yFrame, widthFrame, heightFrame);
        imagen.resize((int)ancho,(int)alto);
        image(imagen, posicion.x, posicion.y);
        xFrameFloat+=(widthFrame*velTransicion*Time.getDeltaTime(frameRate));
        if (xFrameFloat>=nextXFrameFloat) {
          this.xFrame+=this.widthFrame;
          nextXFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame>=this.sprite.imagen.width) {
            this.xFrame=0;
            this.xFrameFloat=0;
            this.nextXFrameFloat=this.widthFrame;
          }
        }
      break;
      case MaquinaEstadoDragon.GANANDO:
        yFrame= heightFrame*3;
        this.velTransicion=8;
        imagen= sprite.imagen.get(this.xFrame, yFrame, widthFrame, heightFrame);
        imagen.resize((int)ancho,(int)alto);
        image(imagen, posicion.x, posicion.y);
        xFrameFloat+=(widthFrame*velTransicion*Time.getDeltaTime(frameRate));
        if (xFrameFloat>=nextXFrameFloat) {
          this.xFrame+=this.widthFrame;
          nextXFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame>=this.sprite.imagen.width) {
            this.xFrame=0;
            this.xFrameFloat=0;
            this.nextXFrameFloat=this.widthFrame;
          }
        }
      break;
      
    }
  }
  
}
