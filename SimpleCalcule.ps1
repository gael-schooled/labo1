# Fonction principale de la calculatrice
function Calculatrice {
    while ($true) {
        # Afficher le menu
        echo "Choisissez une opération :"
        echo "1. Addition"
        echo "2. Soustraction"
        echo "3. Multiplication"
        echo "4. Division"
        echo "5. Quitter"

        # Demander à l'utilisateur de choisir une opération
        $choix = Read-Host "Entrez le numéro de l'opération"

        # Si l'utilisateur choisit 5, quitter la boucle
        if ($choix -eq 5) {
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
            default {
                echo "Choix invalide. Veuillez entrer un numéro valide (1-5)."
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


