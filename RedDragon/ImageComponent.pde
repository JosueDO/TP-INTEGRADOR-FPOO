class ImageComponent{
 
  private PImage imagen;
  
  public ImageComponent(String path){
    imagen= loadImage(path);
  }
  
  public void displayImage(PVector posicion,float ancho,float alto){
    image(imagen,posicion.x,posicion.y,ancho,alto);
  }
}
