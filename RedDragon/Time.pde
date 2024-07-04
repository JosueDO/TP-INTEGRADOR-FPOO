static class Time{
  static float getDeltaTime(float frames){
    int framesPorSeg= round(frames);
    float deltaTime= 1.0/framesPorSeg;
    return deltaTime;
  }
}
