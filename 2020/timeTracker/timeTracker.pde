//TimeTracker. Intervalos de tiempo para que pase algo.
//Ref: https://forum.processing.org/one/topic/make-something-appear-on-a-time-interval.html

int timeTracker = 0;
float timeInterval = 0.5;  //Tiempo de intervalo en segundos
int hola = 0;

void setup() {
  timeTracker = millis();
}

void draw() {
  if(millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    println("Funciona! " + hola++); //Cambiar este println por la acción a repetir.
  }
  
}
