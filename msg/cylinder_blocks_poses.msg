# message type to describe 3-D position of the cylinder blocks
# variable length array, length decided by topic /current_cylinder_blocks
# to be published as a topic

#el tipo de mensaje para describir las pocisiones en 3 dimensiones de los cilindros
#arreglos de longitud en cada variable, la longitud esta decidida
#por el topic /current_cylender_blocks

#tres arrays tipo flotante de 64 bits
float64[] x  # coordenada x en el mundo
float64[] y  # coordenada y en el mundo
float64[] z  # coordernada z en el mundo

#estas tres coordenadas son de cada cilindro

