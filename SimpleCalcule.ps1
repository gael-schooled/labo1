# Demander à l'utilisateur de saisir les deux chiffres
[int]$premier = Read-Host "Entrez le premier chiffre"
[int]$second = Read-Host "Entrez le second chiffre"

# Demander à l'utilisateur de choisir une opération
$choix = Read-Host "Choisissez une opération (addition, soustraction, multiplication, division)"

# Effectuer l'opération choisie
switch ($choix) {
    "addition" {
        $resultat = $premier + $second
        echo "$premier + $second = $resultat"
    }
    "soustraction" {
        $resultat = $premier - $second
        echo "$premier - $second = $resultat"
    }
    "multiplication" {
        $resultat = $premier * $second
        echo "$premier * $second = $resultat"
    }
    "division" {
        if ($second -eq 0) {
            echo "Erreur : Division par zéro !"
        } else {
            $resultat = $premier / $second
            echo "$premier / $second = $resultat"
        }
    }
    default {
        echo "Opération invalide. Veuillez entrer 'addition', 'soustraction', 'multiplication' ou 'division'."
    }
}

