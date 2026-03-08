# FallDownPunk



2D Shoot'em Up made with Godot











🚀 Fall Down Punk – Project Presentation







🎮 Game Concept



Space Shooter est un jeu Shoot’em Up 2D développé avec Godot Engine par Modibo Doumbia (pseudo: Yuzo Noctix).
dans le jeu le joueur contrôle un vaisseau spatial et doit survivre le plus longtemps possible en détruisant les ennemis qui apparaissent dans l’espace.
Et le gameplay repose principalement sur :
le tir rapide
l’esquive
les réflexes
les améliorations (power-ups)
Le joueur doit éviter les ennemis, détruire des asteroids et survivre suffisamment longtemps pour affronter des ennemis plus puissants.





🕹️ Gameplay



Le joueur peut :


-se déplacer horizontalement
-tirer des projectiles
-détruire les ennemis
-collecter des power-ups
-récupérer de la vie
Chaque ennemi détruit augmente le score du joueur.
Si la vie du joueur tombe à 0, la partie se termine.





👾 Types d'ennemis



Le jeu prévoit plusieurs types d’ennemis.



1️⃣Asteroid


Ennemi simple.
Comportement :
spawn en haut de l'écran
descend vers le joueur
inflige des dégâts en cas de collision
meurt lorsqu'il est touché par un projectile



2️⃣ Enemy Shooter (prévu)



Ennemi capable de tirer sur le joueur.
Comportement prévu :
spawn en haut de l'écran
se déplace vers le joueur
tire des projectiles vers le joueur



3️⃣ Asteroid Coriace (prévu)



Asteroid plus résistant.
Caractéristiques :
possède plus de vie
plus difficile à détruire
représente un danger plus important



4️⃣ Boss (prévu)



Grand ennemi de fin.
Caractéristiques prévues :
possède beaucoup de vie
utilise plusieurs attaques
possède des patterns de tir
combat plus long et plus difficile



🔫 Système de tir



Le joueur possède un système de tir basé sur des projectiles.
Les projectiles :
apparaissent devant le vaisseau
se déplacent vers le haut
détruisent les ennemis lorsqu’ils les touchent



⚡ Power-ups



Le jeu inclut plusieurs power-ups permettant d’améliorer les capacités du joueur.
Ratata Power-up
Effet :
tir simple → tir multiple
Exemple :
1 projectile → 3 projectiles
Ce power-up apparaît grâce à un spawner de power-ups.





❤️ Système de santé



Le joueur possède une barre de vie.
La vie diminue lorsque :
le joueur entre en collision avec un ennemi
le joueur reçoit des dégâts
Le joueur peut également récupérer de la vie grâce à un objet de soin.
Cet objet apparaît via un health spawner.





🏆 Système de score



Chaque ennemi détruit augmente le score du joueur.
Le score affiche :
KILL : nombre d'ennemis détruits




🖥️ Interface utilisateur


L’interface affiche :
le score
la santé du joueur
l’écran de Game Over



🏗️ Architecture du projet

Voici une architecture simple et organisée pour le projet.

GAME
│
├── scenes
│   ├── level.tscn
│   ├── player.tscn
│   ├── asteroid.tscn
│   ├── enemy\_shooter.tscn
│   ├── boss.tscn
│   └── projectiles
│       └── player\_projectile.tscn
│
├── enemies
│   ├── asteroid.gd
│   ├── enemy\_shooter.gd
│   └── boss.gd
│
├── player
│   └── player.gd
│
├── spawners
│   ├── asteroid\_spawner.gd
│   ├── powerup\_spawner.gd
│   └── health\_spawner.gd
│
├── powerups
│   └── ratata.gd
│
├── ui
│   ├── score.gd
│   └── game\_over.gd
│
└── assets
├── sprites
├── sounds
└── effects



Cette structure permet :
-un projet clair
-un code organisé
-une évolution facile du jeu





📊 État actuel du projet



Fonctionnalités déjà implémentées :
-joueur fonctionnel
-déplacement du joueur
-système de tir
-projectiles
-asteroids
-spawner d’ennemis
-power-up Ratata
-système de santé
-objets de soin
-système de score
-Game Over
Le jeu est actuellement un prototype jouable.





🔮 Prochaines améliorations



Prochaines étapes :
-Enemy Shooter
-Asteroid coriace
-Boss
-Ensuite :
-animations de dégâts
-animations de mort
-effets visuels
-background animé
-projectiles améliorés
-nouveaux power-ups



🎯 Objectif du projet



Créer un shoot’em up complet et satisfaisant, tout en apprenant :
\*le game design
\*la programmation gameplay
\*l’architecture d’un jeu
\*les systèmes de combat
\*les effets visuels
L’objectif final est de créer un jeu dont le développeur pourra être fier.

