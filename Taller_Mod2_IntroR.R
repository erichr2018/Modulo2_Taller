############################################################
#          Curso Redes Aplicadas 2018 ....                 #
############################################################
#                  Sesión 2:                               #
###########28 de septiembre 2018############################
############################################################
#         Taller introducción a R                          #
############################################################


## Objetivo: Familiarizar al alumno con el uso de R y mostrar
##           el funcionamiento de algunos de los comandos 
##           usados en este curso.


## Lo que aprendera


################Vectores logicos ################################

#Igual que los vectores numericos R permite manipular cantidades logicas.
# Los elementos de una vector logico pueden ser TRUE (T), FALSE (F) o NA (not available)
# Los vectores logicos son generados por  "condiciones"

temp <- x > 13

#temp es un vector de la misma dimension que x  con los valores FALSE o para los
# elementos de x que no cumplen la condición y TRUE para la que si

temp

# Los operadores logicos son: <, <=, >=, == igualdad exacta, != para desiguales
# si c1 y c2 son expresiones logicas entonces c1 & c2 es la intersección ("y")
# c1 | c2 es la union ("O")  y !c1 es la negacion de c1


# Los vectores logicos se pueden usar con aritmetica ordinarioa, en los que 
# FALSE se convierte en 0 y TRUE en 1 . Sin embargo, hay situaciones donde los
# vectores logicos  y sus contrapartes numericas coercionadas no son equivalentes
# se ve acontinuacin


###############Valores omitidos ##########################################


# En algunos casos los componentes de un vector puede que no sean completamente
# conocidos. Cuando un elemento o valor es "not available" o un "missing value"
# en el sentido estadistico, un lugar junto a un vector pude ser resevado asignan-
# dole el valor especial NA. En general cualquier operacion sobre un NA se convierte
# en un NA. La motivación para esta regla es simplemente que si la especificacion
# de una operación es completamente, el resultado no pude conocerse y por lo 
# tanto es " not available".


# la funcion is.na(x) da un vector logico  del mismo tamaño que x con el valor TRUE
# si y solo si el correspondiente elemento x es NA


z <- c(1:3, NA) ; ind <-is.na(z)

z ; ind

# Observe que la expresion logica x==NA es bastante diferente  de is.na(x)
# puesto que NA no es realmente un numero sino un marcador pra una cantidad
# que no esta disponible . pOR LO tanto x==NA es un vector de la 
# misma longitud  que x con todos los valore son NA como expresion logica en
# si misma incompleta y por lo tanto indecidible.

x==NA

x

# Una segunda clase de valores los representa los "missing" valores omitidos
# que son producidos  por el calculo computacional, son los  llamados Not a Number
# el valor NaN. 
 
0/0

Inf - Inf

x

is.na(xx)

xx
is.na(NA)

is.na(NaN)

# is.na(xx) es TRUE tanto para NA y NaN


#############Vectores caracteres############################


# Las cantidades caracter y los vectores caracter se usan frecuntemetne
# en R, ejemplo las leyendas en los graficos.
# Se denotan  por una sucesion de caracters delimitados por doble comillas ""
# el carater escape es \ , \\  es ingresado y mostrado como \\  y dentro de 
# doble comillas " es ingresado \" otras secuencias de escape utiles son
# \n , para nueva linea
# \t, para tabulacion
# \b, para backspace 

?Quotes

# los vectores caracter pueden ser concatenados en un vector por la funcion
# c()

# La funcion paste()  toma un numero arbitrario de argumentos y  los concatena 
# uno por uno  en una cadena de caracteres. Cualesquiera numeros dados  entre los argumnto
# son coercionados en un argumento caracter en forma evidente, esto es, los argumentos 
# son separados por default en el resultado por un caracter de espacio en blanco , pero 
# pero esto puede ser cambiado  por los argumentos llamados sep=string, que cambia 
# esto a string, posiblemtne vacio

labs <- paste(c("X","Y"),1:10,sep="")

labs

c(labs)

##################Indices de vectores; seleccinando y modificando subconjuntos 

# Los subconjunto de elementos de vectores puede ser seleccionados "appending" a el nombre
# del vecto un "index vector" entre corchetes. Mas en general  cualquier expresion  que 
# evaule a un vector puede tene subconjuntos de sus elemetnos similarmente seleccionados pnor
# "appending"  en un vector indice en corchetes inmediatamente despues de la expression(
#   
# Los vectores indices pueden ser de cuatro distintos tipos
# 
# 1. Vector logico : En este caso el vector indice  es reciclado al mismo tamaño
# que el vector a partir del que los elemento son  seleccionados. Los valores correspondintes
# son TRUE en el vector indice que es seleccionado y aquellos correspondientes a FALSE son
# omitidos Ejempll

x

y <- x[!is.na(x)]

y

# crea (o recrea) un objeto "y" que contendra los valores non-missing de x, en el mismo orden.
# Observe que si x tiene valores omitidos, "y" sera mas corto que x. tambien

(x+1)[(!is.na(x)) & x>0] -> z

z

# crea un objeto z y coloca en este los valores del vector x+z para el correspondiente valor en 
# x fuera tanto non-missing y positivo


#2 Cantidades enteras positivas
# En esta caso los valores en el vector indice deben esta en el conjunto {1,2, ..., length(x)}
# Los elementos correspondientes  del vector son seleccionados y concatendadso " en este orden"
# en el resultado. El vector indice puede ser de caulqueir  longitd y el resultado es de la misma
# longitud  que el vector indice. POr ejemplo x[6]  es el sexto componente de x

x[6]

x[3]

x

x[3]

x[1:10]

c("x", "y")[rep(c(1,2,2,1), times=4)]


# un vector de cantidades negativas
# Tal vector indice  especifica valores que son excluidos en vez de incluidos. Por lo tanto

y <- x[-(1:3)]

y

#Un vector de cadena de caracteres
# Esta posiblemente solo aplica donde el objeto tiene nombres
#de atributo para identifiar sus componentes. En este caso el subvector puede ser
# usado en la misma forma  que las etiquetas de entradas en el item 2 

mandado <- c(5,10,1,20)

names(mandado) <- c("jamon", "pan", "leche", "mayonesa")

desayuno <- mandado[c("pan", "leche")]

mandado
desayuno


#La ventaja es que es más facil recordar los indices alfanumericos que 
# los numericos. Esta opcion es util en coneccion con los data frames, 

#Una expresion indexada puede tambien aparecer  sobre el 

x[is.na(x)] <- 0

x
 
y[y<0] <- -y[y<0]

y

y <- abs(y)

y


############Objetos, sus modos y sus atributos############

# Atributos intrinsecos: modoo y longitud

# Las entidades sobre las que opera R son  tecnicamente conocidas como "objetos"

# Ejemplos de esto son los vectores numericos (reales o complejos)
#vectores de valores logicos
# vectores de cadena de caracteres
# estas son conocidas como estructuras "atomicas" debido a que todos sus componentes
# son de la mismo tipo, o "modo", llamado "numeric", "complex", "logical" "character" o 
# "raw".

# Todos los vectores deben tener a todos sus valores del mismo valor 
#sin ambiguedad ya sea logico, numerico, complejo, caracter oraw. La
#unica excepcion a esta regla es el "valor" listado como NA para las cantidades
# no disponigles. Hay varios cantidades NA
# Un vector puede ser vacio . Ejemplo una cadena de caracter vacia

character(0)

numeric(0)

# R opera sobre objetos llamados "listas" que son de modo lista.
# Son  secuencias ordenadas dde objetos que individualmente  pueden ser
# de cualquer modo. 
# listas son conocidas como "recursivas"   en vez de estructuras "atomicas"
# puesto que sus componentes puedenser en si mismas listas


# Las otras  estructuras recursivas son aquellas de modo "funciion" y "expresion"
# Funciones:
#           Son objetoc que forman parte del Sistema de 
# Expresiones: como objetos forman una parte avanzada de R que no sera discutida en esta
#             guia.


#Por "modo" (mode) : queremos  decir  el tipo basico de sus constituyentes fundamentales
# Esto es un caso especial de "property" (propiedad) de un objeto. 
#Otra propiedad  de cada objeto es su "legth" (longitud) . 
#Las munciones mode(object) y length(objetc) se puede usar para encontrar el modo y la
# longitud de cualqueir estructura definida

#ADEMAS LAS PROPIEADES DE UN OBJETO SON DADAS POR  attributes(object) seccion 3.3

# modo y longitud se les llama "atributos intrinsecos" de un objeto

mode(x)

z

z <- c(1, 2, 1+5i)

z 

mode(z)


length(z)


# R da la forma de hacer  los cambios de "modo"  al menos en cualquier lugar

z <- 0:9

z 

mode(z)

digits <- as.character(z)

digits

mode("digits")

#digits es un vector de caracter c("0","1", "2", ...,"9" ) una nueva ""coaccion""
# la vuelve al modo numerico nuevamente

d <- as.integer(digits)

d

mode(d)

#Ahora d y z son el mismo

d == z

#Existe una gran coleccion de funciones de  la forma as.somethin() para coercionar de un modo 
# a otro a otro  as.

#### Cambiando la longitud de un objeto##############

#Un objeto vacio puede establecer teniendo un modo

e <- numeric()

mode(e)

#e es una estructura de vector, vacia de modo numerico. 

# De forma similar character()  es un vector caracter vacio y asi sucesivamente.

#Una vez que es creado un objeto de cualquier tamaño, se le pueden agregar nuevos 
# componentes  SIMPLEMENTE DANDOLE UN INDICE FUERA DE SU RANGO PREVIO.  

length(e)

e[3] <- 17

#Esto hizo un vector de longitud 3,

e
 
length(e)


# Este ajuste automatico de longitud  de un objeto se usa amenudo por ejemplo en la 
# funcion scan()  para input


# Para truncar el tamaño de un objeto solo se requiere  una asignación. 

alpha <- c(1:10)

alpha

length(alpha)

mode(alpha)

alpha <- alpha[2*1:5]

alpha

#Reduciendo la longitud de un vector

length(alpha)

length(alpha) <- 3

alpha

# Aumentando la longitud de un vector

length(alpha) <- 10

alpha

#################Obteniendo y estableciendo atributos de un vector##########

#La funcion attributes(objetc) regresa  una lista de todos los atributos no 
#intrinsecos  actualmente definidos  para este objeto. 
# La funcion attr(object, name)  puede ser usada para seleccionar un atributo
# especifico.

# Estas funciones son raramente usadas a menos que se este  creando una nuevo atributo. 
# Por ejemplo para asociar la creacion de un dato  o un operador con un objeto de R
# El concepto, sin embargo es muy importante
#SE DEBE SER CUIDADOSO CUANDO SE asigna o borran atributos puesto que son una parte
# integral del sistema de objetos en R

#NO SALE
z

attributes(z)

attr(z, "dim")

attr(z,"dim") <- c(10,10)

z

########################################

##3.4 La clase (class) de un objeto##

#Todos los objetos en R tienen una "clase",  que se puede mostrar con la funcion "class".
# Para vectores simples esto es solo el modo, por ejemplo: "numeric", "logical", "character" o "lista"
# pero "matrix", "array", "factor" y "data.frame" son otros posibles valores. 
# Un atributo especial conocido como "clase" del objeto es usado para permitir un estilo de programación
# orientada a objetos en R. 
#EJEMPLO:
# Un objeto de la clase "data.frame", se puede imprimir de cierta forma, la funcion "plot()"  podría
# mostrarlo graficamente  de cierta forma, y otras funciones genericas tales como summary() reaccionaran
# esta en  una forma sensitiva a su clase

#PARA REMOVER TEMPORALMENTE EL EFECTO DE LA CLASE,  SE USA LA FUNCION "unclass()". 
# EJMPLO:
# si winter tiene la clase "data.frame" entonces
# winter
# se imprimira de la forma "data.frame", en vez de matriz
#mientras que 
# unclass(winter)
# se puede imprimir como  una lista ordinarioa. 


##############################################################################
##############################################################################
####### 4 Factores ordenados y factores no ordenados##########################
##############################################################################



# Un factor es un objeto vector usado para especificar una clasificación discreta
#(agrupamiento)  de componentes de otros vectores de la misma longitud. R da tanto
# factores ordenados como desordenados. Mientras que la aplicación "real" de factores
# es con un modelo  formulado, veremos aqui un ejemplo especifico

# Ejemplo Especifico##
#Suponte que tienes 30 personas de todo el país y que tienes una abreviatura
# para cada uno de los estados de la republica. En el siguiente "vector caracter"
# tienes la abreviatura de los estados de origen de cada una de las 30 personas


state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa" ,"wa",
           "qld","vic", "nsw", "vic", "qld", "qld","sa", "tas", 
           "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa", 
           "sa", "act", "nsw", "vic", "vic", "act")
state

# En el caso de un vector caracter "sorted" significa  en orden alfanumerico
#Un "factor" se crea de forma similar usando la funcion factor():

statef <- factor(state)

# La funcion pirnt() maneja a los factores de forma ligeramente diferente que otros
# objetos 

statef

#Para encontrar lso niveles de un factor la funcion levels() se puede usar

levels(statef)

#################4.2 la funcion tapply() and ragged arrays
#Para continuar con el ejemplo, suponga que tenemos los ingresos de los 
# contadores en otro vector en unidades monetarias

incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56, 
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)
length(incomes)

# Para calcular el ingreso medio de la muestra para cada estado podemos usar la
# funcion especial tapply()

incmeans <- tapply(incomes, statef, mean)

#veamos 

incmeans


####Expliacion#################
###############################
#La función tapply()  es usa para aplicar una funcion, aquí mean(),
# a cada grupo de componentes del primer argumento, aquí ingresos
# definidos por los niveles del segundo componente, aqui statef,
# como si fueran estructuras vectoriales separadas. El resultado
# es una estructura de la misma longitud que los niveles atributo
# del factor contenido los resultados. VE LA AYUDA

#Suponga que queremos calcular el error estandar de las medias 
# de ingresos por estado. Para hacerlo ESCRIBIR UNA FUNCION
# para calcular el error estandar para cualquier vector. Dado 
# que existe  una builtin function var() para calcular la varianza
# de la muestra, tal funcion es un una linea muy simple, que se
# especifica por  la asignación

stderr <- function(x) sqrt(var(x)/length(x))

# Escribir tus propias funciones en el cap 10
# es inecesario por que existe la funcion sd()
# Despues de la asignacion , el error estandar es calculado
# por 

incster <-  tapply(incomes, statef, stderr)

incster

##############Factores ordenados##################
#################################################


# Los niveles de factores son guardados en un orden alfanumerico, 
# o en un orden que ellos especifican para "factor" si ellos son
# especificados explicitamente.

# Algunas veces  los niveles tendran un ordenamiento natural que queremos 
# para grabar y queremos nuestro analis estadistico para hace uso de esto

# La funcion 
# ordered()
# la funcion crea dichos factores ordenados por lo demás es identica que
# factor
# Para la mayoria de los propositos  la unica diferencia entre ordered y 
# unordered factors es que los primeros se muestran impresos  en el orden
# de los niveles, pero los contrastes generados por ellos en el ajuste
# de modelos lineales son diferentes.


###################5 Arreglos y matrices#################################
###################################################################
#####################################################################

# Una arrelgo (array)  : es considerado como una coleccion de subindices multiples
# de entradas de datos, por ejemplo numiericos. R da facilidades para crear y manejar
#arreglos , y un caso particualar son las matrices

# Un vector de dimension es un vector de enteros no negativos. Si su longitud es "k"
# entonces el arreglo (array) es k-dimensional, 
# Ejemplo: una matriz es de 2- arreglo dimensional.  Las dimensiones son indexadas 
# a partir de uno hasta el valor dado en la dimension del vector

# Un vector, puede ser usado por R como un array  solo si esta tiene vector dimension
# su atributo "dim". 
# Ejemplo: suponga  que z es un vector de 1500 elementos. La asignacion

rm(z)

z <-  c(1:1500)

dim(z) <- c(3,5,100)

# Fijate: no forzo la dimesion debe ser de la misma que la que establesco

#Otras fuciones tales como matrix()  array()  estan disponibles

# Por ejemplo si el vector dimension  de un arreglo, digamos a, es c(3,4,2)
# entonces existe 3X4X2=24 entradas en a, y el vector de datos los mantiene en el 
# orden a[1,1,1] , a[2,1,1] ..., a[2,4,2], a[3,4,2]
# Los arrays pueden ser de una dimension: los cuales son tratados de la misma froma
# que un vector 


#######5.2 indexando array. Subsecciones de un array

# Elementos individuales de un array se pueden referir dando el nombre del array seguido por los
# subscripts en corchetes, serpados por comoas [,]

#En general, las subseccines de un arreglo (array) se puden especifica dando una secuencia de 
# de vectore indices en lugar de subindices (subscripts), sin embargo si cualquier posicion 
# indice es dada un vector indice  un vector indice es vacio, entonces el rango completo de 
# suindices es tomado


#########BUSCAR EJEMPLOS DE ESTO


# Indices de matrices###

# Al igual que un vector indices en cualquier posicion del subindice, una matriz pude ser 
# usada con una sola matriz indice, con el fin tanto de  asiganar cantidades de vector a una 
# coleccion irregular de elementos en el arreglo, o para extraer un coleccion irregular como un
# vector.

# Un ejemplo de matriz  hace el proceso claro. En el caso de un arreglo doblemente indexado, 
# un indice de matriz puede ser dado consistente  de dos columnas y tantos renglones como se 
# quiera. Las entradas en la matriz indices son los indices RENGLOES  y Los indices COLUMNAS
# EJEMPLO
# Suponga que tenemos una arreglo X de 4 por 5  y queremos hacer lo siguiente

#** Extraer los elementos X[1,3] , X[2,2] y X[3,1] como un estructura de vector 
#** Remplazar estas entradas en el arreglo X por ceros

X <- array(1:20, dim=c(4,5))  # Generamos un arreglo de 4 renglones y 5 columnas

dim(X)

c(1:3,3:1)

array(c(1:3, 3:1))

array(c(1:3, 3:1), dim=c(3,2))   # crea una lista de listas

i <- array(c(1:3, 3:1),dim=c(3,2))

i   

X[i]   # extrae de la matriz los elementos de la lista de lista

# Para poner cero en estas posiciones hacemos lo  siguiente

X[i] <- 0

X

# Indices negativos no son permitidos en la matriz indices. NA y cero son  valores permitidos
# rengloes en la matriz indices que contienen cero son ignorados y renglones que contienen
# NA en el resultado


#######La función array()#######

# Al igual que una estructura de vector dada una atributo "dim", los arrays pueden ser
# construidos a partir de vectores por la funcion array, que tiene la forma
#### Z <-  array(data_vector, dim_vector)##########
h <- c(1:24)

Z <- array(h, dim=c(3,4,2))

Z 

#No se ha declarado h. Si el tamaño de h es exactamente 24 el resultado es el mismo

Z <- h ; dim(Z) <- c(3,4,2)

Z

# ¿Qué pasa si h es menor que 24? sus valores son reciclados desde el inicio nuevamente
# para hacerlo de 24 PERO LA DIMENSION dim(h) <- c(3,4,2) podria mandar una señal
# de error  como un ejemplo:

Z <- array(0,c(3,4,2)) # hacemos un arreglo de ceros

Z

dim(Z) # en este punto  la dimesino de Z se establece como el vector (3,4,2) y

# z[1:24] se establece para el vector de datos como fue hecho el h 

Z[1:24]

Z[]   # el arreglo completo por de fault


####Las operacioens entre arreglos

# Los arrays pueden ser udado en expresiones aritmeticas y el resultado
# es un arrreglo formado por operacines entre el vector de datos elemento
# por elemento, entonces

# D <- 2*A*B + C + 1

# hace un D similar arreglo con sus datos siedo el resutlado de las operaciones
# elemento a elemento. 


####5.4.1 Mezclando vectores y arreglos en opeaciones aritmenticas########
############# La regla de reciclaje######################################


# La regla precisa que afecta calculos mezclados elemento a elemento de 
# vectore y matrices es algo peculiar y dificil de encontrar en la referencia.

# la siguiente es una guia confiable

## La expresion es escaneada de izquierda a derecha
## Cualquier operando que sea un vector corto se extiende por reclicle de sus 
## valores hasta que tenga el tamaño de cualquiera de los operandos
## Siempre que se encuentren vectores y matrices cortos,los arrays todos deben tener
# el mismo atribute dim o resulta un error.
## Cualquier operando vector más grande que una matriz o array genera un error
##Si las estructuras array estan presentes y no hay error o coercion de vector ha sido 
# hecha, el resultado es una estructura array con la dim comun atributo dim de su 
# arrays operados.

###########BUSCAR MAS EJEMPLOS DE OPERACIONES ENTRE MATRICES########

# Los siguientes datos son del libro: A beginners 2.1 First Steps in R

# Medidas morfologicas de 8 aves
#tamaño de la cabeza, las alas, longitud del tarso, peso

# Longitud de las alas

a <- 59
b <- 55
c <- 53.5
d <- 55
e <- 52.5

# Los nombres no nos sirve puesto que son dificiles de recordar
# les damos mejores nombres

Ala1 <- 59
Ala2 <- 55
Ala3 <- 53.5
Ala4 <- 55
Ala5 <- 52.5

#Mas nombres serán necesarios para los datos restantes
# como hemos visto podemos hacer calculos con estos valores
# como los siguientes:

sqrt(Ala1)

2 * Ala1

Ala1 + Ala2

Ala1 + Ala2 + Ala3 + Ala4 + Ala5

(Ala1 + Ala2 + Ala3 + Ala4 + Ala5)/5

# Como hemos visto esto hace los calculos pero no los guarda
# por lo cual es mejor dales nombre de una variable

SQ.ala1 <- sqrt(Ala1)

Mul.A1 <- 2*Ala1

Sum.12 <- Ala1 + Ala2

Sum12345 <- Ala1 + Ala2 + Ala3 + Ala4 + Ala5

Av <- (Ala1 + Ala2 + Ala3 + Ala4 + Ala5)/5

SQ.ala1

#Para mostrar el valor despues de asignar tenemos la opción
# de colocar parentesis alrededor de la asignación

(SQ.ala1 <- sqrt(Ala1))

SQ.ala1 

# Otra forma forma de asignar de una sola vez es usando
# la funcion c()

AlasL <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)

length(AlasL)

AlasL

#Para el primer valor

AlasL[1]


# Los primeros 5 valores

AlasL[1 : 5]

# Todos excepto el segundo valor
# El signo menos omite el valor

AlasL[-2]

sum(AlasL)

#guardamos la suma en una nueva variable

S.ala <- sum(AlasL)

S.ala

# Vamos con los otros datos

Tarso <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)

Cabeza <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)

Ps <- c(3.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)

#Usamos mayusculas al principio porque la mayoria de los 
#comandos de R no usan mayuscualas al comienzo

sum(Cabeza) # puesto que hay un valor NA

?sum

#If na.rm is FALSE an NA or NaN value in any of the arguments 
#will cause a value of NA or NaN to be returned, otherwise NA and NaN values are ignored.

sum(Cabeza, na.rm=TRUE) #ignora NA


############cbind() y rbind()##################################

# sigamos con las variables que hemos creado
# AlasL, Tarso, Cabez, Ps
# De la misma forma que concatenamos numeros 
# podemos hacerlo con las variables

AveDat <- c(AlasL, Tarso, Cabeza, Ps)

AveDat

length(AveDat)

# no usams data puesto que es una funcion de R

?data

data() #Muestra los nombres de bases de datos

# puesto que no distinguidos los valores 
# de las distintas variables podemos hacer
# lo siguiente

Id <- c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3
        ,4,4,4,4,4,4,4,4)

Id

# La variable Id nos servirá para indicar  que todas
# las observaciones con un mismo valor de Id pertenecen
# a la misma variable.

#Esto puede consumir mucho tiempo si la base de datos
# es grande por lo que podemos usar una fucion que repita

Id <- rep(c(1,2,3,4), each=8)

Id

# Se puede simplificar aun más

Id <- rep(1 : 4, each=8)

Id

1:4

# la funcion secuencia nos sirve tambien

a <- seq(from = 1, to = 4, by = 1)

a

a <- seq(from = 1, to = 4, by = 1)
rep(a, each=8)

# Pero no solo podemos usar valores numericos

VarNom <- c("AlasL", "Tarso", "Cabeza", "Ps")

VarNom

Id2 <- rep(VarNom, each = 8)

Id2 

rep(VarNom, 8)

# Cada una de las variables como columnas

Z <- cbind(AlasL, Tarso, Cabeza, Ps)

Z

#Para los datos de la primer columna 
# primer entrada renglon
# segunda entrada columna
# entonces

Z[ , 1]

# o de forma alternativa

Z[1:8, 1]

#Fijamos el renglon y corremos sobre la columna

Z[2, ]

# o de forma alternativa

Z[2, 1:4]

#Observe que obtiene de cada uno de ellos

Z[1,1]
Z[,2:3]
X <- Z[4,4]
X
Y <- Z[ , 4]
Y
W <- Z[ , -3]
W
D <- Z[ , c(1,3,4)]
D
E <- Z[ , c(-1,-3)]
E

# Asegurate que no te salgas del rango de la 
# dimension del arreglo

Z[8,4] # valido

Z[9,5] #no es valido
 
# para la dimension

dim(Z) #renglones X columnas

# R da esta informacion

nrow(Z)

ncol(Z)

n <- dim(Z)

n

?nrow

zrow <- dim(Z)[1]

zrow

# con rbind podemos concatenar renglones

Z2 <- rbind(AlasL, Tarso, Cabeza, Ps)

Z2


#####Ejercicio pag. 51###########

###La funcion Vector#####

# En vez de la función c se puede usar vector 
# Supon que se desea crear un vector de longitud
# 8 qe contenga los dato de AlasL

W <- vector(length = 8)

W[1] <- 59
W[2] <- 55
W[3] <- 53.5
W[4] <- 55
W[5] <- 52.5
W[6] <- 57.5
W[7] <- 53
W[8] <- 55

W

W[1] ; W[1:4] ; W[2:6] ; W[-2] ; W[c(1,3,5)] ; W[9]


########## Usando Matrices  ##############

# Podemos crear una matriz de 8 (renglones) X 4 (columnas)

Dmat <- matrix(nrow = 8, ncol = 4)
Dmat

# Creada pero sin valores hasta ahora
# Vamos a llenarla

#llenamos la primer columna
Dmat[ , 1 ] <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Dmat[ , 2] <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Dmat[ , 3] <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Dmat[ , 4] <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)

Dmat

# Podemos usar la funcion colnames para agregar los nombres
# a Dmat:

colnames(Dmat) <- c("AlasL", "Tarso", "Cabeza", "Ps")
Dmat

#Existe rownames buscalo en la ayuda

# Se debe definir la matriz antes de ingresar los elementos.

# Se podrían ingresar elemento a elemento

Dmat[1,1] <- 59.0
Dmat[1,2] <- 22.3

# Si tenemos listas las variables podemos usar el siguiente 
# comando

Dmat2 <- as.matrix(cbind(AlasL, Tarso, Cabeza, Ps))

Dmat2

# Podemos preguntar si es realmente una matriz
is.matrix(Dmat2)

is.data.frame(Dmat2)

# Algunas operaciones basicas entre matrices son

# Sean A y B dos matrices t(A) es la transpuesta,
# A%*%B para la multiplicacion de matrices
# solve(A) encuentra la inversa

#ejercicio 4 pag 54

##############data frame###########


# En data.frame se pueden combinar variables de la misma
# longitud. Es similar a las funciones matrix o cbind
# La ventaja de data.frame es que se pueden hacer cambios
#  en lo datos sin afectar los datos originales. 
# Por ejemplo es posible combinar los pesos originales
# (pero renombrados) y la raiz de los pesos en el data frame.
# OTRA COSA IMPORTANTE DE DATA.FRAME ES QUE SE PUEDEN
# COMBINAR  VARIABLES NUMERICAS, DE CARÁCTER Y FACTORES.
# ESTOS UTLTIMOS SON VARIABLES NOMINALES (CATEGORICAS) 
# SE VEN MAS ABAJO

Dfrm <- data.frame(WC = AlasL, TS = Tarso, HD = Cabeza, W = Ps)

Dfrm #Las ordena como columnas

Dfrm <- data.frame(WC = AlasL, TS = Tarso, HD = Cabeza, W = Ps,
                   Wsq = sqrt(Ps))
 
Dfrm

# W y Ps son objetos distintos

rm(Ps)

Ps

Dfrm$W

# el uso de data frame es en el siguiente orden
# ingresamos los valores a R de la forma que lo 
# hemos hecho hasta ahora. Entonces hacemos cambios
# en los datos (ejemplo eliminamos valores extremos,
# aplicamos transformaciones, y agregamos variables 
# categoricas) guardamos los valores modificados en 
# un data frame que se usara para el analisis


#Hasta ahora hemos usado herramientas que combinan
# datos para producri una tabla donde cada  renglón
# es una unidad de muestreo (un pajaro en este caso)


# Suponga que se quiere una caja negra donde
# se quiera poner  tantas variables como se
# quiera, algunas pueden estar relacionadas, 
# algunas puden tener dimensiones similares, 
# algunas son vectores, otras matrices, aun
#otras pueden contener cadenas de caracteres 
# de variables nombres

# Esto es lo que puede hacer la funcion
##lista

# La principal diferencia con lo anterior es que
# los renglones no necesariamente representan 
# un sola unidad d emuestra. 


# Ejemplo:

x1 <- c(1,2,3)
x2 <- c("a","b","c","d")
x3 <- 3
x4 <- matrix(nrow=2, ncol=2)
x4[ , 1] <- c(1,2)
x4[ , 2] <- c(3,4)
Y <- list(x1 = x1, x2 = x2, x3 = x3 , x4 = x4)

# Veamos como se muestra Y

Y


# Podemos obtener la informacion contendida en  Y
# escribiendo por ejemplo:
# Y$x1 , y$x2 

# A estas alturas ya te estas preguntando porque
# tenemos que pasar todos estos problemas

# Casi todas las funciones en R producen 
# salidas que se almacenan en listas

M <- lm(WC ~ Dfrm$W, data = Dfrm)


# No vamos a ver que es una regresion lineal
# pero nos interesa como R almacena
# la información obtenida en el objeto M

names(M)

# Podemos obtener cada uno de ellos usando
# M$---

M$coefficients ; M$residuals 

# obtenemos ojetos de distintas dimensiones

# Usando los datos que tenemos para las aves
# hacemos lo almacenamos en una lista
# Agregamos un vector extra que identifique
# los grupos de variables (ID), una matrix
# que contenga los datos en el formato 8x4
# y finalmente un vector que contenga
# los nombres morfologicos

AllData <- list()


##################### Tablas de frecuencia a partir de factores############


################Leyendo datos desde los archivos#################
AllData <- list(AveDat = AveDat, Id = Id2, Z=Z, VarNom=VarNom)

AllData$AveDat

AllData$Id
AllData$Z
AllData$VarNom


# Usar listas es solo preparase para la mayoria de los 
# formatos de R. Nosotros solo cambiamos los formatos
# si y cuando sea necesario

AllData

# en la pagina 59 hay una buena figura para el almacenaje de datos
# sirve de guia y referencia

# Ejercicio

##############Importando datos##################


#Dos formas de importar datos desde Excel 
# 1) peraprar los datos en Excel
# 2) exportarlo a un archivo ascii delimitado por tab 
# 3) cerrar Excel
# 4) usar la funcion read.table en R para importar datos

# para el caso 2) es un paquete especial de R llamado
# RODBC que puede obtener acceso a renglones elegidos
# y columnas de la hoja de Excel. 

# Proponemos que Columnas sean variables
# y renglones muestras, observaciones, casos
# unidades de muestreo etn
# NA en las celdas son valores omitidos

# En Excel podemos ir a File > Save as > Save as Type
# y seleccionamos Text (Tab delimited)
# Tenemos un archivo en llamado squid.txt delimitado
# por tab.

# PRECAUCIÓN: Excel tiene la tendencia de  agregar columnas
# extres de NAs a el archivo ascii si tiene en alguna parte
# comentarios

# Ahora con el archivo ascii delimitado por tab que no 
# contiene espacios en blanco o nombres con espacios
# podemos ahora importar los datos en R. 
# read.table

# Veamos como funciona con una base de datos tomamada de 
######libro  A biginners
######## bajar otra y prepararla
###################

#Leemos los datos
Random <- read.table(file = "C:\\Users\\Eric\\Documents\\Economia\\Proyectos_2018\\Curso_Redes_2018\\Curso_Redes_2018_Material_de_Trabajo\\Temas_Eric\\Modulo_1_ Introducción a la teoría de redes y sus herramientas de análisis\\Modulo_1_2_Practica\\RBook\\Random.txt", header = TRUE, dec = ",")

Random
# ¿Cuales son los nombres de las variables?
names(Random)

# str (structure) es un comando que da informacion a cerca del status de 
# cada viable. int: enteros, num: numeric  y 

str(Random)

# si observamos la mayoria son considerados 
# Factor, lo cual dice que si consideramos 
# funciones como mean o un boxplo R enviará
# error. Puesto que no son numericos

# Por lo que es importante mezclar read.table con
# names y str

columna1

Random$columna1

Random$columna2

# tambien podemos seleccionar una columna
# ejemplo columna 1

Random [ , 2]


?data.frame

# se debe ser cuidadoso con los formatos
# puesto que este separado por como como cvs 
# no necesariamente lo lee correctamente
# revisar pag. 61

# otra diferencia entre read.table y scan es 
# que read table  guarda los datos como data.frame
# mientras que scan lo hace como matriz. La fución
# 
