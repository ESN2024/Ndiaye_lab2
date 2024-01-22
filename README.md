# Ndiaye_lab2

# I. Introduction :
L'objectif de ce rapport est de présenter le travail accompli lors des travaux pratiques de l'UE Conception Conjointe, visant à approfondir nos connaissances et à les mettre en œuvre à travers la création d'une architecture NIOS pour coder un compteur BCD en langage C. Le cahier des charges était clair : utiliser la plate-forme DE-10 équipée d'un FPGA Max-10 pour concevoir un compteur BCD affichant le décompte en hexadécimal sur trois afficheurs 7 segments. Le compteur devait être incrémenté chaque seconde via une interruption générée par un Timer.

# II. Architecture :
À partir du cahier des charges, nous avons déterminé l'architecture à mettre en place sur la plate-forme designer. Le schéma ci-dessous présente notre choix :

 ![image](https://github.com/ESN2024/Ndiyae_lab2/assets/153745637/b56abd49-9f53-411d-93ee-fec78a6df0ee)

Création d'un système NIOS II basique
Platform Designer
![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/5d6c8415-2c20-4a30-b48a-c2ff62d93d5c)


Les composants de notre systeme sont:

onchip_memory : Une RAM offrant une capacité de stockage de 40 Mo.

pio_0 : Représente la sortie Qsys du premier compteur 4 bits.

pio_1 : Représente la sortie Qsys du deuxième compteur 4 bits.

pio_2 : Représente la sortie Qsys du troisième compteur 4 bits.

Timer_0 : Configurer la période de ce dernier à 1 seconde.

# III Processus et Résultats
# - Processus

Après la configuration de notre fichier qsys, nous devons créer les codes VHDl de notre système
Quartus

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/e23d4527-894e-4164-bb0b-0fe5ac4967d1)

Les différents fichiers du projet sont

lab2.qsys: le fichier qsys généré préalablement dans platform designer

bin_to_7_seg.vhd : Ce fichier VHDL prend en entrée un signal de 4 bits (compteurs) et génère en sortie une correspondance de 7 bits pour l'activation des segments du compteurs. Il est à noter que le 7 segments réagit au niveau logique "0", s'allumant lorsque ce niveau est détecté.

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/1e92496c-564d-4813-a31f-c2cbc205d76b)

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/9dd466a8-4c55-426d-89a1-9a9946f3c71f)



lab2_vhd.vhd : Ce fichier définit les entrées et les sorties, avec trois sorties de 7 bits chacune correspondant aux segments des 3 compteurs.

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/1cd4fe25-ad46-4417-a121-21e8616c3345)

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/22704ef5-289f-45dd-9ce4-9034c0aaaa6d)


Flux logiciel du NIOS II
Ouvrons un terminal NIOS II et générons le BSP en lien avec les spécifications de la carte DE-10, en ce mettant de préférence 
dans le répertoire où se trouve nos fichiers vhd et qsys :

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/fedcc2ed-5ab1-4261-ad2b-bd814618686a)

Pour générer lz fichier BSP, il faut utiliser la commande nio2-bsp hal <bsp dir> <system.sopinfo> 

Générons le Makefile du projet avec la commande nios2-app-generate-makefile --app-dir <app dir> --bsp-dir <bsp dir> --elf-name <system.elf> --src-files <fichier.c>

Tout est prêt, nous allons maintenant écrire notre code C qui fonctionne sur notre propre processeur.

Notre programme en C est structuré comme ci:

Une fonction main initialisant mon timer et l'activant:

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/e8bf4bb0-78f4-4cc5-b733-250e815ec99b)

Et ma fonction simple_irq qui incrémente mon compteur toutes les secondes et me l'affiche sur mes afficheurs 7 segments.

![image](https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/1298c83f-cf6a-4854-a59f-f5b48db68b35)

# - Résultat

Après le make download-elf permettant à notre carte de recevoir le code c créé, nous obtenons:

https://github.com/ESN2024/Ndiaye_lab2/assets/153745637/349204be-57ce-46df-a4ad-7250e495aee9


# IV Conclusion
