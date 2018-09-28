############################################################
#          Curso Redes Aplicadas 2018 ....                 #
############################################################
#                  Sesión 2:                               #
###########28 de septiembre 2018############################
############################################################
#         Taller introducción a Igraph                     #
############################################################


## Objetivo: El alumnos se familiarizará con Igraph
#             y será capaz de contruir un objeto "grafo"
#            de Igraph a partir de las distintas opciones
#            existentes.


# Funciones a usar:
#                   graph_from_literal()   make_graph() 
#                   graph()                graph.atlas()  
#                   sample()              graph_from_edgelist()
#                   matrix()              cbind()
#                   nrow()                rownames()
#                   seq()                   


# Verificando el el directorio de trabajo 

getwd()

setwd("C:/CR2018/Mod1")

getwd()

install.packages("igraph")

library(igraph)


#Consultamos el paquete: igraph

help("igraph")

?igraph


###### Introduccción a Igraph ##############


# Igraph cuenta con algunas funciones que hacen grafos de manera predeterminada.
# Vamos a comenzar usando un comando predeterminado de Igraph, el fin de esto
# es mostrar la información que contiene  un objeto "grafo" de igraph. No debe
# preocuparse si no entiende en primer instancia la funcion make_ring, pero 
# centre su atencion en la información que se dará más adelante.

# make_ring()

# Descripción
# Un anillo es un "lattice" de una dimension y esta función es un caso especial de 
# "make_lattice"

# Modo de uso

# make_ring(n, directed = FALSE, mutual = FALSE, ciruclar=TRUE)

# Argumentos
#n              Numero de nodos (vertices)
#directed       Si la grafica es diereccionada
#mutual         Si los vinculos direccionados son mutuos. esto se ignora en un grafo no direccionado
# circular      si se va a crear un anillo circular. Un anillo no circular es esencialmente una linea.
#               un arbol si cada nodo que no es hoja tiene un hijo
# ...           paso a make_ring

# Valor

# Un grafo de Igraph

?make_ring    # ver manual

make_ring(10)  # Creamos un grafo de igraph, al crearse muestra la informacion en la consola

# Sobre la informacion que se muestra despues de crear el grafo make_ring(10)

#   IGRAPH    nos dice que es un grafo de Igraph
#   ----      4 bits  1)  U undirected (no direccinado)
#                       D directed    (direccinado)
#                     2)  N si los nodos tiene nombre
#                     3)  W grafo pesado (vinculos con atributo de peso)
#                     4)  B grafos bipartitos (si los nodos tiene el atributo "tipo")

# 2 numeros         1) numero de nodos
#                   2) numero de vínculos

# --            despues de esto el nombre del grafo    
#
#       SIGUIENTE LINEA
#
# attr:         Si el grafo tiene algun (o algunos) atributo(s) en nuestro caso 
#               el atributo "name" de tipo carácter
#               mutual (g/x)  y circular (g/x) atributos tipo complex
#               ser refire que estos atributos no son ni numericos ni carácter
#
#        Al final pone la lista de vínculos


#             OBTENIENDO INFORMACION DEL GRAFO

# Hay varias formas de pedir la informacion de un grafo
# a continuacion mostramos dos funciones que nos ayudan con esto, 
# print_all() y  summary() 


print_all(make_ring(10))    #Nos enfocamos en la info que da

# La siguiente funcion da la información de manera resumida

summary(make_ring(10))   # La misma informacion pero sin los vínculos

# Graficamos el grafo

plot(make_ring(10, circular=TRUE))  # circular

plot(make_ring(10, circular=FALSE)) # Linea


####################  Una red simple  ####################


################ FUNCION: graph_from_literal() #######################


# Creando grafos (pequeños) via una interfaz simple
#
#       graph_from_literal(..., simplify=TRUE)
#
#Descripción:
#             Esta función es util si lo que se desea es crear un
#             grafo pequeño (con nombres) de forma rapida. Sirve
#             tanto para grafos direccionados como no direccionados.
#             La expresion consiste del nombre de los nodos y los 
#             operadores vínculos.

?graph_from_literal

# ...       esta parte da la estructura del grafo
# simplify  es un escalar logico para la creacion del 
#           grafo. Por default el grafo es simplificado
#           no hay blucles ni multivínculos

graph_from_literal()   # crea un grafo 0 nod 0 vínculos

print_all(graph_from_literal())  # ver informacion

#Creando los nodos y los vínculos

# VINCULOS:
# una secuencia de los caracteres "-" y "+" vinculos y 
# flechas respectivamente.
# SOLO "-" ES UN GRAFO NO DIRECCIONADO
# CON UNO SOLO "+" ES UN GRAFO DIRECCIONADO
# NO IMPORTA LA EXTENSION DE ESTOS

graph_from_literal(A-B)

plot(graph_from_literal(A-B))

# Si se necesita colocar nodos aislados estos se colocan
# separados con comas

graph_from_literal(A--B, C--D, E--F, G--H, I, J, K)

plot(graph_from_literal(A--B, C--D, E--F, G--H, I, J, K))


####  OPERADOR " : " EN GRAFOS ###############


# El operador ":" define dos conjuntos de nodos. Si un operador
# vinculo opera sobre dos conjuntos de nodos cada nodo del 
# primer conjunto es conectado a cada nodo del segundo conjunto

# Ejemplo:

graph_from_literal(A:B:C:D -- A:B:C:D)

plot(graph_from_literal(A:B:C:D -- A:B:C:D))


#PONER PARA REDES DIRECCIONADAS################################
# graph_from_literal(A+B)
# 
# plot(graph_from_literal(A+B))

# En grafos direccinados, los vínculos son creados si se incluye
# el operador flecha (+) AL FINAL DEL VÍNCULO

graph_from_literal(A -+ B -+ C)

plot(graph_from_literal(A -+ B -+ C))

graph_from_literal(A +- B -+ C)

plot(graph_from_literal(A +-  B -+ C))

graph_from_literal(A +- B -- C)

plot(graph_from_literal(A +- B -- C)) # no se crea el vinculo b-c


# Para vínculos mutuos tenemos

graph_from_literal(A +-+ B +---+ C ++ D + E + E )

plot(graph_from_literal(A +-+ B +---+ C ++ D + E + E )) #no hay blucles

# Como ver un bucle

graph_from_literal(A +-+ B +---+ C ++ D + E + E , simplify=FALSE)


plot(graph_from_literal(A +-+ B +---+ C ++ D + E + E, simplify=FALSE ))


# Nodos con nombres

graph_from_literal("Pepito" +- "Juan" -+ "Rosa")

plot(graph_from_literal("  Pepito  " +- "  Juan  " -+ "  Rosa  "))

graph_from_literal("  +  " +- "  -  " -+ "  %  ")

plot(graph_from_literal("  +  " +- "  -  " -+ "  %  "))


###################ACABA DIRECCIONADO CON GRAPH_FROM_LITERAL###########

?make_graph

########## FUNCION:  make_graph()  ##################
# 
# Descripción:
#             Crea un grafo de Igraph a partir de una lista de vínculos
#             o un grafo conocido que esta precargado

# Modo de Uso 

#           make_graph(vínculos, ..., n = max(vínculos), isolates = NULL, 
#                       directed=TRUE,dir= directed, simplify=TRUE)

# make_directed_graph(vínculos, n = max(vínculos))

# make_undirected_graph(vinculos, n = max(vínculos))


## Argumentos:

#   vinculos:         Un vector define los vínculos, el primer elemento 
#                     vínculado al segundo elemento, el tercer elemento
#                     vinculado al cuarto y asi susesivamente. Si es un 
#                     vector numerico estos son interpretados como los id's
#                     de los nodos. Para vectores caracter, estos son inter-
#                     pretados como los nombres de los nodos
#                     Tabién se puede proporcinar el nombre de un grafo concido

#  ... :              Se refiere a argumetos extras cuando el grafo es dado 
#                     de forma literal (graph_from_literal) 
#                     para grafos no direccionados y grafos direccionados: 
#                     lo hacemos con make_directed_graph o make_undirected_graph

#  n :                es el numero de nodos en el grafo. Este argumento es
#                     ignorado si (con advertencia) los vínculos son 
#                     nombres de nodos simbolicos. Se ignora si existe un id
#                     del nodo en los vinculos. Para esta funcion es seguro
#                     dar cero si el nodo con el id más largo no es aislado

# isolates:           un vector caracter, con los nombres de los nodos aislados
#                     para una lista de vinculos simbolicos. Se ignora para lista
#                     de vinculos numericos.

# directed:           si se crea un grafo direccionado

# dir                 es lo mismo que directed, NO DAR AMBOS

#simplify             para simplificar grafos literarles

### Como se menciono make_graph puede hacer algunos grafo conocidos. Se debe dar
#   el nombre del grafo (insensible a mays y minus), un caracter escalar en lugar
#   del argumento vínculos y otros argumentos son ignorados

c(1:10)  # vector numerico

make_graph(c(1:10),directed=FALSE)

plot(make_graph(c(1:10),directed=FALSE))

####DIRECCINADO CON MAKE_GRAPH############
make_graph(C(1:10), directed=TRUE)

plot(make_graph(c(1:10),directed=TRUE))
###########DG #########################

# poniendo lista de aislados

make_graph(c(1:10),isolates=c(11,12,13),directed=FALSE) #lanza advertencia e ignora a los aislados,vector numerico

plot(make_graph(c(1:10),isolates=c(11,12,13),directed=FALSE))

make_graph(c(1:10),n=15,directed=FALSE)

plot(make_graph(c(1:10),n=15,directed=FALSE)) #ponemos el explicitamente el numerod de nodos

# grafos con nombres

make_graph(c("A", "B", "B", "C", "C", "D"), directed=FALSE)

plot(make_graph(c("A", "B", "B", "C", "C", "D"), directed=FALSE))

plot(make_graph(c("A", "B", "B", "C", "C", "D"),n=10, directed=FALSE)) # se ignora el n para nombres simbolicos

make_graph(c("A", "B", "B", "C", "C", "D"), isolates = c("E","F", "G"), directed=FALSE)

plot(make_graph(c("A", "B", "B", "C", "C", "D"), isolates = c("E","F", "G"), directed=FALSE))


# Los grafos notables para una lista más grande


make_graph("Bull")

plot(make_graph("Bull"))

make_graph("Dodecahedral")

plot(make_graph("Dodecahedral"))

make_graph("house")

plot(make_graph("house"))

make_graph("ZACHARY")

plot(make_graph("ZACHARY"))

?make_graph

# Podemos contruir una lista de grafos "notables"

solidos <- list(make_graph("Tetrahedron"), make_graph("Cubical"), make_graph("Octahedron")
                , make_graph("Dodecahedron"), make_graph("Icosahedron"))

solidos
?make_graph

make_graph( ~ A-B-C-D-A, E-A : B : C :D)

make_graph(~ E-A:B:C:D, J- F : G : H : I)

make_graph(~E-A:B:C:D, O-T,I-P)

plot(make_graph(~E-A:B:C:D, O-T,I-P))

grafo <- make_graph( ~ A-B-C-D-A, E-A:B:C:D,
                     F-G-H-I-F, J-F:G:H:I,
                     K-L-M-N-K, O-K:L:M:N,
                     P-Q-R-S-P, T-P:Q:R:S,
                     B-F, E-J, C-I, L-T, O-T,
                     M-S, C-P, C-L, I-L, I-P) 


plot(grafo)

# graph hace lo mismo que make_graph() ##

graph("Dodecahedral") 




########  graph.atlas  #############

# Crea un grafo a partir del "Atlas de grafos"

# Descripción

#           graph_from_atlas crea un grafo a partir del libro
#           "Un atlas de grafos" de Roland C. Read y Robin J.
#           Wilson. El atlas contiene todos los grafos no direccionados
#           con hasta 7 nodos, numerados de 0 hasta 1252. Estos grafos
#           son enlistados :
#             1.  En orden creciente de numero de nodos
#             2.  Para un numero fijo de nodos, en orden creciente de 
#                 el numero de vinculos
# Argumentos:
#             n     El id del grafo a crear.
#             ...   Pasado a graph_from_atlas


graph_from_atlas(0)
graph_from_atlas(1)
graph_from_atlas(2)

g <- graph_from_atlas(sample(0:1252,1))

print_all(g)

plot(g)


###   Crendo grafos a partir de una lista ########

        ##   graph_from_edgelist   ##

#Descripción:
#             graph_from_edgelist crea un grafo a partir de una lista de
#             vinculos. Su argumento es una matriz de dos columnas, cada 
#             renglon define un vinculo. Si es una matriz numerica estos
#             elementos se interpretan como los id's de los nodos. Si es
#             una matriz de caracteres entonces se interpreta como los 
#             nombres simbolicos de los nodos y un id sera asignado a cada
#             nombre y se agregara el atributo nombre del nodo.

#Modo de uso:

#           graph_from_edgelist(el, directed=TRUE)

#Argumentos:
#             el         La lista de vínculos, una matriz de 2 columnas
#                        puede ser numerica o de caracter
#             directed   Si quiere crear un grafo direccionado
#             ...        pasa a graph_from_edgelist

#  Veamos algunos ejemplos:

#  Ejemplo del uso de matrix()

matrix(c("gato", "perro", "perro" , "ratón"), nc=2)

matrix(c("gato", "perro", "perro" , "ratón"),nc=2, byrow=TRUE)

# creando un matriz de 2 X 2

el <- matrix(c("gato", "perro", "perro" , "ratón"),nc=2, byrow=TRUE)

# Con esta lista graph_from_edgelist() crea un grafo
# Por default direccionado, esta razon agregamos un argumento 
# mas a la funcion.

graph_from_edgelist(el, directed = FALSE)

plot(graph_from_edgelist(el, directed = FALSE))


# Creando un anillo #

# 1 -2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 1
# lista de vinculos

# 1   2
# 2   3
# 3   4
# 4   5
# 5   6
# 6   7
# 7   8
# 8   9
# 9   10
# 10  1

# Usen lo que saben

c(2:10,1)   # concatena
1:10        # secuencia

cbind(1:10,c(2:10,1))  # forma columnas


graph_from_edgelist(cbind(1:10, c(2:10,1)),directed=FALSE)

plot(graph_from_edgelist(cbind(1:10, c(2:10,1)),directed=FALSE))


## Creando grafos desde matrices de adyacencia  ##
#       graph_from_adjacency_matrix()

#Descripción:

#             graph_from_adjacency_matrix() es un funcion flexible para 
#             crear un grafo de Igraph a partir de matrices de adyacencia:

# Modo de uso:

#           graph_from_adjacency_matrix(adjmatrix, 
#                              mode = c("directed", "undirected", 
#                             "max", "min", "upper", "lower", "plus"),
#                              weighted= NULL,
#                              diag=TRUE, add.colnames = NULL, 
#                              add.rownames = NA)

# Argumentos    
#             adjmatrix:      Una matriz de adyacencia cuadrada. 
#             
#             mode:           Una escala de caracteres que especifica como 
#                             Igraph podría interpretar la matriz ingresada.  
#                             posibles valores: directed, unidirected, upper
#                             ,lower, max, min, plus.        

#             weighted:       Este argumento especifica si crea un grafo
#                             pesado a partir de la matriz de adyacencia.
#                             Si es NULL entonces se crea una grafo no 
#                             pesado (ponderado).

#             diag            Escalar logico, para incluir la diagonal 
#                             de la matriz en el calculo. Si es FALSE 
#                             entonces la diagonal es puesta en cero
#               
#             add.colnames    Caracter escalar,para agregar los nombres
#                             de las columnas como un atributo de nodo
#                             . Si es NULL (default) entonces, si estan
#                             presentes los nombres de columna son agre-
#                             gados como atributo "name" del nodo. Si 
#                             es NA entonces no seran agregados. si es
#                             un caracter constante, entonces este da el
#                             nombre del atributo del nodo para agregar.

#             add.rownames    Caracter escalar, agrega los nombres de los
#                             renglones como atributo del nodo. Los posibles
#                             valores son los mismos que el de add.colnames
#                             Por default row names no es agregado. Si 
#                             add.rownames y add.colnames especifican los
#                             los mismos atributos del nodo, el primero es
#                             ignorado.
#                             

?graph_from_adjacency_matrix   # Informacion anterior

# Ejemplo:

# Obtenemos una muestra de 100 elementos todos 1 o 0
sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1))

#Formamos una matriz de 10 columnas, matriz de 10X10

adjm <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1)), nc=10)

adjm

g1 <- graph_from_adjacency_matrix( adjm ,mode="undirected",diag=FALSE)

g1

plot(g1)

# Ejemplo:

# Agregando nombres a los renglones y las columnas

nrow(adjm) # numero de renglones de una matriz

sample(letters, nrow(adjm)) # una muestra de nrow letras

rownames(adjm) <- sample(letters, nrow(adjm))

colnames(adjm) <- seq(ncol(adjm))

g2 <- graph_from_adjacency_matrix(adjm, mode = "undirected",
                                  diag=FALSE,
                                  add.colnames = "code")

summary(g2)

plot(g2)


##    Creando grafos a partir de un data frame o viceversa  ##
#             graph_from_data_frame( )


# Descripción:
#             Esa función crea un grafo de igraph a partir de uno o dos
#             data frames que contiene la lista (simbolica) de vínculos
#             y atributos de  los vínculo y nodos.

# Modo de uso:

#             as_data_frame(x, what = c("edges", "vertices", "both"))

#             graph_from_data_frame(d, directed = TRUE, vertices=NULL)

# Argumentos:

#             x         un objeto igraph
#             what      carácter constante, si se quiere regresar infor
#                       referente a los nodos, vínculos o ambos. Por default
#                       son los vínculos
#             d         Un data frame que contiene una lista de vínculos simbolicos
#                       en las primeras dos columnas. Además, las columnas adicionales
#                       son consideradas como atributos de los vínculos.
#             directed  Escalar logico, para crear o no un grafo direccionado
#             vertices  Un data frame con metadatos de vertice, o NULL. 

# #

#El aso tipico es que estas tablas se lean a partir de un archivo

actores <- data.frame(nombre=c("Alicia", "Bob", "Cecil", "David", "Esmeralda"),edad=c(48,33,45,34,21)
                      ,genero=c("F","M","F","M","F"))
relaciones <- data.frame(from=c("Bob","Cecil","Cecil","David","David","Esmeralda"), to=c("Alicia", "Bob",
                        "Alicia", "Alicia","Bob", "Alicia"))
g <- graph_from_data_frame(relaciones, directed = TRUE,vertices = actores)
print(g, e=TRUE, v=TRUE)
plot(g)

g
 
# del grafo a data.frame

as_data_frame(g, what="vertices")

as_data_frame(g, what="edges")
