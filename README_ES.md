# 🔢 Push_swap Tester

## Este tester cuenta con:

### 🔹 Controlación de errores.

### 🔹 Todos los casos posibles de 2 a 5 numeros. Checkeo si queda ordenado y se hace en menos de los movimientos que se requieren.

### 🔹 Tests infinitos de 100 numeros y 500 donde te indica la eficiencia y el numero de movimientos.

### 🔹 Un test para cada tamaño posible del 1 al 500.

### 🔹 Tests en caso de argumentos ya ordenados.

### 🔹 Indicador de promedio de movimientos.

### 🔹 Controlación de leaks de memoria.

### 🔹 Checkeo del bonus.

## Uso

El fichero push_swap_test.sh y el checker_Mac se deben ubicar en el mismo directorio donde este el programa push_swap. Una vez abramos el terminal y estemos ubicados en ese directorio ejecutaremos el comando: 

```bash push_swap_test.sh``` 

Tambien podemos añadir dos argumentos que sera la cantidad de veces que ejecutaremos test de 100 y 500. Si no se introduce argumentos por defecto se haran 200 test de cada. 

```bash push_swap_test.sh 250 250```. 

<img width="540" alt="Screen Shot 2022-10-09 at 11 06 42 PM" src="https://user-images.githubusercontent.com/66915274/194779534-cf66c958-46a4-4c6f-bf2f-587af4ad8f8e.png">

Si quieres ejecutar el bonus:

```bash push_swap_test.sh -b```.

Si quieres ejecutar el bonus y definir la cantidad de test de size100 y size500:

```bash push_swap_test.sh -b 100 100```

<img width="448" alt="Screen Shot 2022-10-10 at 3 12 48 AM" src="https://user-images.githubusercontent.com/66915274/194788176-19454b9d-61b7-4921-b440-1073c3d22c50.png">

### ❗️ Si falla un test y quieres ver el argumento que ha sido mandado al programa visualiza el fichero traces.txt ❗️

# 👀 Visualizador 

Herramienta útil para visualizar tu algoritmo de forma grafica. Programa creado por ![ailopez-o](https://github.com/ailopez-o).

![REPOSITORIO DEL VISUALIZADOR](https://github.com/ailopez-o/42Barcelona-PushSwap-ProChecker)

Si quieres ejecutarlo escribe el siguiente comando. El numero representa la cantidad de argumentos que recibira push_swap.

```bash push_swap_test.sh -v 500```

<img width="597" alt="Screen Shot 2023-01-13 at 5 23 58 PM" src="https://user-images.githubusercontent.com/66915274/212369245-54455057-43d9-42c5-a916-a825ff505813.png">

Si quieres ejecutar el visualizador con unos argumentos en especifico utiliza el siguiente comando seguido de los argumentos deseados entre comillas dobles.

```bash push_swap_test.sh -v2 "1 4 2 3 5"```

## Controles 🕹

|TECLA|ACCION|
|---|---|
|`I`| Step by Step instructions|
|`S`| Run all the instructions|
|`P`| Pause |
|`1`| exec 'sa'|
|`2`| exec 'sb'|
|`3`| exec 'ra'|
|`4`| exec 'rb'|
|`5`| exec 'rra'|
|`6`| exec 'rrb'|
|`7`| exec 'pa'|
|`8`| exec 'pb'|
|`ESC ❌`|Close|

# Espero que te sea útil! 😁

# Quizás pueda interesarte!

### - Para ver mi progresion en el common core 42 ↙️

[AQUÍ](https://github.com/gemartin99/42cursus)

### - Mi perfil en la intranet de 42 ↙️
[AQUÍ](https://profile.intra.42.fr/users/gemartin)

# Contacto 📥

### Contacta conmigo si hay algun problema o necesitas ayuda! Puede ayudar a futuros estudiantes! 😁

◦ Email: gemartin@student.42barcelona.com

◦ Linkedin: https://www.linkedin.com/in/gemartin99/

# Contacto de Ailopez 📬

### Contacta con él si hay algun error con el visualizador! Puede ayudar a futuros estudiantes! 😁

◦ Email: ailopez-@student.42barcelona.com

◦ Linkedin: https://www.linkedin.com/in/aitor-lopez-de-audicana-70125b38/

◦ Github: https://github.com/ailopez-o

◦ Perfil en la intranet de 42: https://profile.intra.42.fr/users/ailopez-

