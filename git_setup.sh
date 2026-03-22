# Demande à l'utilisateur de saisir son nom complet
echo "Type in your first and last name (no accent or special characters - e.g. 'ç'): "
# Stocke la réponse dans la variable full_name
read full_name

# Demande à l'utilisateur de saisir son adresse email
echo "Type in your email address (the one used for your GitHub account): "
# Stocke la réponse dans la variable email
read email

# Configure l'email de l'utilisateur dans les paramètres globaux de git
git config --global user.email $email
# Configure le nom de l'utilisateur dans les paramètres globaux de git
git config --global user.name $full_name

# Ajoute tous les fichiers modifiés à l'index git
git add .
# Crée un commit avec un message spécifique
git commit --message "My identity for @lewagon in the gitconfig"
# Pousse les modifications vers la branche master du dépôt distant origin
git push origin master

# Ajoute un nouveau dépôt distant nommé upstream pointant vers le dépôt dotfiles de lewagon
git remote add upstream git@github.com:lewagon/dotfiles.git

# Extrait le nom d'utilisateur GitHub à partir de l'URL du dépôt origin
GITHUB_NICKNAME=$(git remote get-url --push origin | cut -d ":" -f 2 | cut -d "/" -f 1)
# Récupère l'email associé au dernier commit sur GitHub via l'API
GITHUB_EMAIL=$(curl -s https://api.github.com/repos/${GITHUB_NICKNAME}/dotfiles/commits/`git rev-parse HEAD` | jq -r '.commit.author.email')
# Récupère l'email configuré localement dans git
GIT_EMAIL=$(git config --global user.email)

# Vérifie si l'email GitHub correspond à l'email git local ou si l'email GitHub est vide
if [ "${GITHUB_EMAIL}" = "${GIT_EMAIL}" ] || [ -z ${GITHUB_EMAIL} ]
then
  # Si les emails correspondent ou si l'email GitHub est vide, affiche un message de succès
  echo "👌 Awesome, all set."
else
  # Si les emails ne correspondent pas, affiche un avertissement
  echo "⚠️  Mismatch! Your GitHub email is ${GITHUB_EMAIL} whereas your git email is ${GIT_EMAIL}"
  # Propose des commandes pour corriger le problème
  echo "You should run these commands to fix it:"
  echo "  git config --global user.email ${GITHUB_EMAIL}"
  echo "  git commit --amend --author '${full_name}<${GITHUB_EMAIL}>'"
  echo "  git push --force origin master"
fi
