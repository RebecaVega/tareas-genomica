### REBECA VEGA ESCAMILLA ###
### TAREA 0 ###

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("XVector")
library(BiocManager)
library(Biostrings)
library(XVector)
library(GenomeInfoDb)

### SECUENCIA CORRESPONDIENTE DE AA ###

secs<- readRNAStringSet("first (1).fasta") #Aquí estoy cargando mis secuencias
aa<- translate(secs) # Despues cree otro objeto que se llama aa para traducirlas
                    # a aminoacidos y lo corrí y salio un bello mensaje
aa

### PROBLEMA 1 : Complementing a Strand of DNA ###

# Dado: Una cadena de ADN de longitud como máximo 1000 pb .

# Retorno: El complemento inversos  de s.

cadena<- readDNAStringSet("revcom.fasta") #cargue de nuevo un archivo fasta 
                                          # con otra secuencia 
cadena
  complement(cadena) # y con ayuda de complement saque el reverso complemento

  # para hacerlo sin librería especializada intente con un ciclo for pero 
  # la verdad no supe bien como definirlo y lo intente tambien con chartr 
  # pero se sustituyen de una manera incorrecta entonces tal vez se podria 
  # intentar con ifelse de tal manera que si encuentra una A la cambie por T 
  # y asi consecutivamente pero dudo como hacerlo
  
cadena2<- chartr("T","A",cadena)
cadena2
cadena3<-chartr("G","C",cadena2)
cadena3

for (i in 1:100) {
  chartr("T","A",cadena)
  chartr("C","C",cadena)
  print(cadena)
}



### PROBLEMA 2:  Counting DNA Nucleotides ###

# Dado: Como máximo 10 cadenas de ADN en formato FASTA (de longitud como máximo
# de 1 kbp cada una).
# Retorno: El ID de la cadena que tiene el contenido de GC más alto, seguido del
# contenido de GC de esa cadena. Rosalind permite un error predeterminado de 0,001
# en todas las respuestas decimales a menos que se indique lo contrario; consulte
# la nota sobre el error absoluto a continuación.

sec = sample(DNA_ALPHABET[1:4],100,replace = TRUE)
sec
paste(sec,collapse="")

# aqui al principio nada mas estaba probando algunas funciones como generar
# aleatoriamente una secuencia para hacer varias y copiarlas,  pero eso
# solo genera las letras a azar asi que para hacerla una cadena use ´paste(sec,collapse="")

cadenas<- readDNAStringSet("ptdos.fasta") 
cadenas
# ya que tuve mis secuencias en un archivo, lo cargo 
# y despues voy a pedirle que me de la frecuencia de GC

  letterFrequency(cadenas, "GC")

contcg<- letterFrequency(cadenas, "GC", as.prob = TRUE)

# estoy tratando de usar ifelse pero no se como hacer para que me salga solo el 
# mas alto sin poner mayor que pero no se como supongo que va por ahí y ya cuando
# la condicion se cumpla le pido que me imprima el nombre para que salga el ID.

mas_alto <- if (contcg > 1)
  print(names(contcg))
mas_alto




