# Tarea1-iOS
## Explicacion del proyecto
  Esta tarea consiste en hacer un juego en iOS que es Memorizar imagenes y poner la respuesta correcta y con una puntuacion

## Enunciado del proyecto

Desarrollar una aplicación en iOS que permita jugar a un juego en que vaya apareciendo una secuencia de imágenes que el usuario debe recordar. Después se presentarán todas las imágenes posibles y el jugador debe elegir la secuencia correcta. Al terminar el juego se debe guardar la puntuación que se podrá consultar en una lista de puntuaciones anteriores guardadas online. Las especificaciones en el diseño, sistema de puntuación o navegación se dejan al criterio del alumno. Los elementos visuales deben adaptarse al tamaño y la orientación del dispositivo cambiando su tamaño y posición para aprovechar toda la pantalla.

## Requisitos de la aplicacion
#### La aplicación debe tener al menos las siguientes `pantallas`:
- `Juego`: Muestra secuencia de imágenes y muestra todas para elegir
- `Fin`: Informa del fin del juego y muestra la puntación final y la puntuación máxima (guardada localmente)
- `Puntuaciones`:  Lista de puntuaciones ordenada de mayor a menor (guardada online)

## Funcion de imagen aleatoria

```ruby
@objc func showNextImage() {
    # Compara el index con la lista de shuffle
    if currentIndex == numShuffle.count {
      timer.invalidate() # Detener el temporizador
      ImageStackView.isHidden = false
      MainImageView.isHidden = true
      return
    }
    # Muesta las imagenes que todavia no han salido y suma mas 1 al currentIndex
    ImageView.image = imagenes[numShuffle[currentIndex]]
    print(currentIndex)
    currentIndex += 1
}
```
## Funcion de Botones
Esto es un array de botones que en la aplicacion sirven para dar respuestas a los imagenes que salen aleatorio
```ruby
@IBAction func OnButtonTap(_ sender: UIButton) {
  # For donde pulsamos los botones, los pone en enabled-false y añade en la lista de playerSequence
  for i in 0 ..< Buttons.count{
    if Buttons[i] == sender{
      	Buttons[i].isEnabled = false
        playerSequence.append(i)
    }
  ButtonPuntuationView.isEnabled = true
  }
}
```
