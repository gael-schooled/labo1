# Fonction pour calculer le PGCD (Plus Grand Commun Diviseur)
function Calculer-PGCD {
    param([int]$a, [int]$b)

    while ($b -ne 0) {
        $temp = $b
        $b = $a % $b
        $a = $temp
    }
    return $a
}

# Fonction pour calculer le PPCM (Plus Petit Commun Multiple)
function Calculer-PPCM {
    param([int]$a, [int]$b)

    $pgcd = Calculer-PGCD $a $b
    return [math]::Abs($a * $b) / $pgcd
}

# Fonction principale de la calculatrice
function Calculatrice {
    while ($true) {
        # Afficher le menu
        echo "Choisissez une opération :"
        echo "1. Addition"
        echo "2. Soustraction"
        echo "3. Multiplication"
        echo "4. Division"
        echo "5. PGCD (Plus Grand Commun Diviseur)"
        echo "6. PPCM (Plus Petit Commun Multiple)"
        echo "7. Quitter"

        # Demander à l'utilisateur de choisir une opération
        $choix = Read-Host "Entrez le numéro de l'opération"

        # Si l'utilisateur choisit 7, quitter la boucle
        if ($choix -eq 7) {
            echo "Merci d'avoir utilisé la calculatrice. Au revoir !"
            break
        }

        # Demander les deux chiffres
        [int]$premier = Read-Host "Entrez le premier chiffre"
        [int]$second = Read-Host "Entrez le second chiffre"

        # Effectuer l'opération choisie
        switch ($choix) {
            1 {
                $resultat = $premier + $second
                echo "$premier + $second = $resultat"
            }
            2 {
                $resultat = $premier - $second
                echo "$premier - $second = $resultat"
            }
            3 {
                $resultat = $premier * $second
                echo "$premier * $second = $resultat"
            }
            4 {
                if ($second -eq 0) {
                    echo "Erreur : Division par zéro !"
                } else {
                    $resultat = $premier / $second
                    echo "$premier / $second = $resultat"
                }
            }
            5 {
                # Calcul du PGCD
                $resultat = Calculer-PGCD $premier $second
                echo "Le PGCD de $premier et $second est : $resultat"
            }
            6 {
                # Calcul du PPCM
                $resultat = Calculer-PPCM $premier $second
                echo "Le PPCM de $premier et $second est : $resultat"
            }
            default {
                echo "Choix invalide. Veuillez entrer un numéro valide (1-7)."
            }
        }

        # Demander si l'utilisateur veut faire un autre calcul
        $continuer = Read-Host "Voulez-vous faire un autre calcul ? (O/N)"
        if ($continuer.ToUpper() -ne 'O') {
            echo "Merci d'avoir utilisé la calculatrice. Au revoir !"
            break
        }
    }
}

# Lancer la calculatrice
Calculatrice
