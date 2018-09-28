############################################################
#          Curso Redes Aplicadas 2018 ....                 #
############################################################
#                  Sesion 2:                               #
###########28 de septiembre 2018############################
############################################################
#         Taller introduccion a R                          #
############################################################


## Objetivo: Familiarizar al alumno con algunas de las funciones
#            de R, utiles al momento de crear un grafo de Igraph. 


## Las funciones que vamos a aprender en este Modulo son:
#            1. vectores (carateres)
#            2. Listas
#            3. Matrices
#            4. DataFrame



#Vectors

v1 <- c(1, 5, 11, 32)
v3 <- c(TRUE, TRUE, FALSE)
v2 <- c("hola", "mundo") 




# paste() :   Esta funcion toma un numero arbitrario de argumentos y  los concatena 
#             uno por uno  en una cadena de caracteres. Cualesquiera numeros dados
#             entre los argumentos son coercionados en un argumento caracter, esto es,
#             los argumentos son separados por default en el resultado por un caracter
#             de espacio en blanco, pero esto puede ser cambiado  por los argumentos 
#             llamados sep = string, que cambia el espacio en blaco por string, 
#             posiblemtne vacio.


labs <- paste(c("X","Y"),1:10)

labs

c(labs)

labs2 <- paste(c("X", "Y"), 1:10, collapse = ",")
labs2

labs3 <- paste(c("X","Y"),1:10, sep = ", ")
labs3

labs4 <- paste(c("X","Y"),1:10, sep = "") #quita espacio en blaco
labs4

v1 <- c(1, 5, 11, 32)
v2 <- c("hola", "mundo") 
v3 <- c(TRUE, TRUE, FALSE)

v4 <- c(v1, v2, v3, "boo") 

v4

v <- 1:7  # lo mismo que c(1,2,3,4,5,6,7)

v <- rep(0, 77) # esto repite el cero 77 veces

v <- rep(1:3, times=2) # repite 1,2,3 dos veces

v <- rep(1:10, each=2)  # repite cada elemento dos veces

v <- seq(10,20,2) # secuence: numeros entre 10 y 20, en saltos de 2

v1 <- 1:5  #1,2,3,4,5
v2 <- rep(1,5) #1,1,1,1,1

#Revisa la longitud de un vector

length(v1)  #longitud de  v1
length(v2) # longitud de v2


#Marices y Arreglos

m <- rep(1,20) # Un vector de 20 elementos, todos 1
m
dim(m) <- c(5,4) # Agrupa las dimesiones del conjunto a 5 X 4 , por lo tanto m es una matriz de 5X4
m  # 5(renglones) x 4(columnas) c(5,4) c(renglones, columnas)

# Creando matrices por medio del comando matrix()

m <- matrix(data=1, nrow=5, ncol=4) # lo mismo que la matriz de arriba, 5x4, llena de 1s
m
m <- matrix(1,5,4)   # esto hace lo mismo que la matriz de arriba (renglon anterior)
dim(m) # te devuelve renglones columnas 5x4

#Vamos a crear una matriz combinando vectores

m <- cbind(1:5, 5:1, 5:9) # matriz de 5 rengloens x 3 columnas
m
m <- rbind(1:5, 5:1, 5:9) # matriz de 3 renglones x  columnas
m

# Seleccionando elementos de la matriz

m[2,3]  # renglon 2 columna 3 este es 3
m[2,]   # todos los elementos del renglon 2
m[,2]   # todos los elementos de la columna 2 2,4,6
m <- matrix(1:10, 10, 10)
m
m[1:2, 4:6] #Submatriz: renglon 1 y 2 y columnas 4,5 y 6
m[-1,] # todos los renglones *excepto* el primero
#Algunas operaciones con matrices
m[1,]==m[,1] # Todos los elemetos del renglon 1 son equivalentes a los correspondientes elemntos de la columna1
m>3 # Una matriz logica: Verdadero para los m elementos > 3, Falso en otro caso:
m[m>3] #Selecciona solo los elementos Verdaderos, es decir, los que son mayores de 3
m
t(m) # traspuesta
m <- t(m) # Asignamos a m la traspuesta de m
m
m %*% t(m) # hace la multiplicacion MATRICIAL
m*m # hace una multiplicacion elemento a elemento

# Los arreglos o array son utilizados cuando tenemos más de dos dimensiones
a <- array(data=1:18,dim=c(3,3,2)) # 3d con dimensiones 3x3x2
a
#El anterior es un vector de 2 entradas donde cada entrada es un matriz de 3x3
a <- array(1:18, c(3,3,2)) # lo mismo de arriba
a
#LISTAS
#Las listas son colecciones de objeos. Una sola lista puede contener todas las clases de elementos 
# - cadenas de caracteres, vectores numericos, matrices, y otras listas y más. Los elementos de las listas
# a menudo llamadas para acceso sencillo 
v
v2
v3


l1 <- list(boo=v , foo=v2 , moo=v3 , zoo="Animals!") # una lista con cuatro componetes


l1


l2 <- list(v1, v2, v3, "Animals!")

l1

l2

l3 <- list()
l3
l4 <- NULL
