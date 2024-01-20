# Ndiaye_lab2

# I. Introduction :
L'objectif de ce rapport est de présenter le travail accompli lors des travaux pratiques de l'UE Conception Conjointe, visant à approfondir nos connaissances et à les mettre en œuvre à travers la création d'une architecture NIOS pour coder un compteur BCD en langage C. Le cahier des charges était clair : utiliser la plate-forme DE-10 équipée d'un FPGA Max-10 pour concevoir un compteur BCD affichant le décompte en hexadécimal sur trois afficheurs 7 segments. Le compteur devait être incrémenté chaque seconde via une interruption générée par un Timer.

# II. Architecture :
À partir du cahier des charges, nous avons déterminé l'architecture à mettre en place sur la plate-forme designer. Le schéma ci-dessous présente notre choix :

 ![image](https://github.com/ESN2024/Ndiyae_lab2/assets/153745637/b56abd49-9f53-411d-93ee-fec78a6df0ee)

Des détails supplémentaires incluent l'utilisation d'un CPU NIOS II lite, un bus LED de 8 bits, un bus switch de 4 bits, et une fréquence de clock de 50 MHz provenant de la DE10. Après la génération du fichier VHDL et la compilation du design, j'ai assigné les différents pins de mon design aux E/S de la DE-10 via le Pin Planner de Quartus. Le JTAG UART est utilisé pour le débogage de l'application à travers la console NIOS II.

Le bus reliant les 7 segments au PIO de sortie est un bus de 12 bits, éliminant ainsi la nécessité d'utiliser un système de type double dabble pour compter en hexadécimal.

# - Architecture du projet :
Dans ce laboratoire, une nouvelle dimension est ajoutée à la conception. Nous souhaitons créer un fichier VHDL pour le décodeur 7 segments, que nous utiliserons pour décoder la sortie de l'architecture NIOS. Ainsi, nous devons d'une part concevoir le système NIOS et d'autre part créer notre fichier "bin_to_7_seg.vhdl". Une fois cela réalisé, nous utilisons un fichier top level pour établir le lien entre les deux entités (voir : Lab_2_vhd.vhd).

# III. Design du code C :
Nous entrons maintenant dans l'essence même du TP. Les avantages de l'utilisation d'une architecture NIOS résident dans notre capacité à nous affranchir du VHDL en codant notre application en langage C, tout en mettant en œuvre la dynamique du système, qui peut comprendre différentes IP VHDL. La partie opérative est effectuée en C, facilitant ainsi la programmation séquentielle.

Le but du TP est d'afficher un compteur BCD sur trois décodeurs 7 segments, incrémenté chaque seconde via l'interruption générée par le Timer de l'architecture NIOS II.

Ainsi, nous actualisons, au sein d'une boucle while infinie, le compteur en envoyant directement la valeur de 12 bits en entrée des trois décodeurs. Cela permet d'éviter l'utilisation de trois bus différents et de se passer d'un double dabble. L'incrémentation de la variable volatile "compteur" se fait dans la fonction "Time handler" déclenchée par l'interruption périodique générée par le timer. Pour ce faire, l'initialisation du timer et de l'interruption est nécessaire.

# IV. Conclusion :
Ce TP a constitué une excellente initiation à la mise en œuvre d'un Timer, à la conception d'une architecture basée sur Nios, au lien entre une IP créée par nos soins et un fichier top level, ainsi qu'à l'implémentation d'un code C sur cette architecture. Une démonstration vidéo de mon système est disponible, avec un pas de compteur de 100 et une accélération de deux fois, permettant d'observer la remise à zéro du compteur et le bon défilement de tous les caractères sur les trois décodeurs.
 
 

