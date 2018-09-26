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


# PONER LAS FUNCIONES QUE APRENDERA

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

make_ring(10)

# Para graficar, usamos la funcion plo( )

plot(make_ring(10))

# Ejemplos:

print_all(make_ring(10))    #Nos enfocamos en la info que da

# Explicación

#   IGRAPH  nos dice que es un grafo de Igraph
#   ----    4 bits  1)  U undirected (no direccinado)
#                       D directed    (direccinado)
#                   2)  N si los nodos tiene nombre
#                   3)  W grafo pesado (vinculos con atributo de peso)
#                   4)  B grafos bipartitos (si los nodos tiene el atributo "tipo")

# 2 numeros         1) numero de nodos
#                   2) numero de vínculos

# doble -- y el nombre del grafo    Si el grafo tiene el atributo "nombre"

# Siguiente renglón   contiene los atributos del grafo
# el atributo "name" de tipo carácter
# mutual (g/x)  y circular (g/x) atributos tipo complex
# ser refire que estos atributos no son ni numericos ni carácter

# Al final pone la lista de vínculos

# La siguiente funcion da la información de manera resumida
summary(make_ring(10))


plot(make_ring(10, circular=TRUE))  #linea o circular

###########################################################################
###########################################################################
# El siguiente es material para la 2 sesion del 28 de septiembre.         #
# Es posible que se hagan modificaciones y correcciones para fines        #
# expositivos. Si embargo puede ir revisando el material para que se      #
# familiarice con este.                                                   #
###########################################################################

################ graph_from_litera() #######################


# Creando una grafos (pequeños) via una interfaz simple
#       graph_from_literal(..., simplify=TRUE)
#Descripción:
# Esta función es util si lo que se desea es crear un
# grafo pequeño (con nombres) de forma rapida, sirve
# tanto para grafos direccionados como no direccionados

?graph_from_literal

# ...       esta parte da la estructura del grafo
# simplify  es un escalar logico para la cracion del 
#           grafo. Por default el grafo es simplificado
#           no hay blucles ni multivínculos

graph_from_literal()   # crea un grafo 0 nod 0 vínculos

print_all(graph_from_literal())  # ver informacion

# Es necesario dar informacion para crear la estructura
# del grafo. Esta informacion consiste en el nombre de
# los nodos y los operadores de vínculos. 
# VINCULOS:
# una secuencia de los caracteres "-" y "+" vinculos y 
# flechas respectivamente.
# SOLO "-" ES UN GRAFO NO DIRECCIONADO
# CON UNO SOLO "+" ES UN GRAFO DIRECCIONADO
# NO IMPORTA LA EXTENSION DE ESTOS

graph_from_literal(A-B)

plot(graph_from_literal(A-B))

graph_from_literal(A+B)

plot(graph_from_literal(A+B))

# Si se necesita colocar nodos aislados estos se colocan
# separados con comas

graph_from_literal(A--B, C--D, E--F, G--H, I, J, K)

plot(graph_from_literal(A--B, C--D, E--F, G--H, I, J, K))

# El operador ":" define dos conjuntos de nodos. Si un operador
# vinculo opera sobre dos conjuntos de nodos cada nodo del 
# primer conjunto es conectado a cada nodo del segundo conjunto
#Ejemplo

graph_from_literal(A:B:C:D -- A:B:C:D)

plot(graph_from_literal(A:B:C:D -- A:B:C:D))

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


##########  make_graph() ##################
# Descripción
# Crea un grafo de Igraph a partir de una lista de vínculos
#o un grafo conocido que esta precargado

# Modo de Uso (revisar el manual)

# make_graph(vínculos, ..., n = max(vínculos), isolates = NULL, directed=TRUE,
#             dir= directed, simplify=TRUE)

# make_directed_graph(vínculos, n = max(vínculos))

# make_undirected_graph(vinculos, n = max(vínculos))

# directed_graph(...)

# undirected_graph(...)

## Argumentos:

#   vinculos:         Un vector define los vínculos, el primer elemento 
#                     vínculado al segundo elemento, el tercer elemento
#                     vinculado al cuarto y asi susesivamente. Si es un 
#                     vector numerico estos son interpretados como los ids
#                     de los nodos. Para vectores carácter, estos son inter-
#                     pretados como los nombres de los nodos
#                     Tabién se puede proporcinar el nombre de un grafo concido

#  ... :              Se refiere a argumetos extras cuando el grafo es dado 
#                     de forma literal (graph_from_literal) 
#                     para directed_graph y undirected_graph: lo hacemos con
#                     make_directed_graph o make_undirected_graph

#  n :                es el numero de nodos en el grafo. Este argumento es
#                     ignorado si  (con advertencia) si los vínculos son 
#                     nombres de nodos simbolicos. Se ignora si existe un id
#                     del nodo en los vinculos. Para esta funcion es seguro
#                     dar cero si el nodo con el id más largo no es aislado

# isolates:           un vector caracter, con los nombres de los nodos aislados
#                     para una lista de vinculos simbolicos. Se ignora para lista
#                     de vinculos numericos.

# directed:           si se crea un grafo direccionado

#simplify             para simplificar grafos literarles

### Como se menciono make_graph puede hacer algunos grafo conocidos. Se debe dar
#   el nombre del grafo (insensible a mays y minus), un caracter escalar en lugar
#   del argumento vínculos y otros argumentos son ignorados

c(1:10)

make_graph(c(1:10),directed=FALSE)

plot(make_graph(c(1:10),directed=FALSE))

make_graph(C(1:10), directed=TRUE)

plot(make_graph(c(1:10),directed=TRUE))

# poniendo lista de aislados

make_graph(c(1:10),isolates=c(11,12,13),directed=FALSE) #lanza advertencia e ignora a los aislados

plot(make_graph(c(1:10),isolates=c(11,12,13),directed=FALSE))

make_graph(c(1:10),n=15,directed=FALSE)

plot(make_graph(c(1:10),n=15,directed=FALSE)) #ponemos el explicitamente el numerod de nodos

# grafos con nombres

make_graph(c("A", "B", "B", "C", "C", "D"), directed=FALSE)

plot(make_graph(c("A", "B", "B", "C", "C", "D"), directed=FALSE))

plot(make_graph(c("A", "B", "B", "C", "C", "D"),n=10, directed=FALSE)) # se ignora el n para nombres

make_graph(c("A", "B", "B", "C", "C", "D"), isolates = c("E","F", "G"), directed=FALSE)

plot(make_graph(c("A", "B", "B", "C", "C", "D"), isolates = c("E","F", "G"), directed=FALSE))

# Los grafos notables para una lista más grande

# ?make_graph

?make_graph

make_graph("Bull")

plot(make_graph("Bull"))

make_graph("Dodecahedral")

plot(make_graph("Dodecahedral"))

make_graph("house")

plot(make_graph("house"))

make_graph("ZACHARY")

plot(make_graph("ZACHARY"))

# Podemos contruir una lista de grafos "notables"

solidos <- list(make_graph("Tetrahedron"), make_graph("Cubical"), make_graph("Octahedron")
                , make_graph("Dodecahedron"), make_graph("Icosahedron"))

solidos

make_graph( ~ A-B-C-D-A)

make_graph(~E-A:B:C:D)

make_graph(~E-A:B:C:D, O-T,I-P)

plot(make_graph(~E-A:B:C:D, O-T,I-P))

#Otra opcion es graph

graph( ~ A-B-C-D-A)

########  graph.atlas  #############

# Crea un grafo a partir del "Atlas de grafos"

#Descripción

#   graph_from_atlas crea un grafo a partir del libro
#   "Un atlas de grafos" de Roland C. Read y Robin J.
#   Wilson. El atlas contiene todos los grafos no direccionados
#   con hasta 7 nodos, numerados de 0 hasta 1252. Estos grafos
#   son enlistados :
#   1. en orden creciente de numero de nodos
#   2. para un numero fijo de nodos, en orden creciente de 
#   el numero de vinculos
#   Argumentos:
#               n   el id del grafo a crear
#               ... pasado a graph_from_atlas



g <- graph_from_atlas(sample(0:1252,1))
print_all(g)
plot(g)


##############Crendo grafos a partir de datos###############

##graph_from_edgelist###########

#Descripción
# graph_from_edgelist crea un grafo a partir de una lista de
# vínculos. Su argumento es una matriz de dos columnas, cada 
# renglon define un vinculo. Si es una matriz numerica estos
# elementos se interpretan como los id's de los nodos. Si es
# una matriz de caracteres entonces se interpreta como los 
# nombres simbolicos de los nodos y un id sera asignado a cada
# nombre, y tambien se agregará el atributo nombre del nodo

#Modo de uso

# graph_from_edgelist(el, directed=TRUE)
# from_edgelist(...)

#Argumentos:
#             el        La lista de vínculos, una matriz de 2 columnas
#                       puede ser numerica o de caracter
#             directed  Si quiere crear un grafo direccionado
#             ...       pasa a graph_from_edgelist

#Veamos algunos ejemplos:

c("gato", "perro", "perro" , "ratón")

matrix(c("gato", "perro", "perro" , "ratón"),nc=2, byrow=TRUE)

el <- matrix(c("gato", "perro", "perro" , "ratón"),nc=2, byrow=TRUE)

graph_from_edgelist(el)

plot(graph_from_edgelist(el))

#Creando un anillo a mano

graph_from_edgelist(cbind(1:10, c(2:10,1)))

plot(graph_from_edgelist(cbind(1:10, c(2:10,1))))


#### Creando grafos desde matrices de adyacencia

#Descripción:

# graph_from_adjacency_matrix es un funcion flexible para crear
# un grafo de igraph a partir de matrices de adyacencia

# Modo de uso:

# graph_from_adjacency_matrix(adjmatrix, mode = c("directed", "undirected", 
#                             "max", "min", "upper", "lower", "plus"), weighted= NULL
#                             ,diag=TRUE, add.colnames = NULL, add.rownames = NA)
#from_adjacency(...)


# Argumentos    
#             adjmatrix:      Una matriz de adyacencia cuadrada. 
#             mode:           Un caracter escala que especifica como 
#                             igraph podría interpretar la matriz ingresada.  
#                             posibles valores: directed, unidirected, upper
#                             ,lower, max, min, plus.        
#             weighted:       Este argumento especifica si crea un grafo
#                             pesado a partir de la matriz de adyacencia.
#                             Si es NULL entonces se crea una grafo no ponderado
#             

sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1))

adjm <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1)), nc=10)

adjm

g1 <- graph_from_adjacency_matrix( adjm )

g1

plot(g1)
#####Creando grafos a partir de un data frame o viceversa##########

# Descripción:
#             Esa función crea un grafo de igraph a partir de uno o dos
#             data frames que contiene la lista (simbolica) de vínculos
#             y atributos de  los vínculo y nodos.

# Modo de uso:

# as_data_frame(x, what = c("edges", "vertices", "both"))

# graph_from_data_frame(d, directed = TRUE, vertices=NULL)

# from_data_frame(...)


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
#             ...       Pasado a graph_from_data_frame

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
