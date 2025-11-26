#!/usr/bin/env bash

set -e

# On définit une fonction "wp" qui force PHP à utiliser 512M de mémoire
wp() {
  php -d memory_limit=512M /usr/local/bin/wp --allow-root "$@"
}

echo "🔥 Installation WordPress avec WP-CLI..."

echo "💡 PHP memory_limit utilisé par WP-CLI via php :"
php -d memory_limit=512M -r "echo ini_get('memory_limit') . PHP_EOL;"

echo "⏳ Attente de la base de données..."
sleep 10

# Télécharger WordPress si pas déjà là
if [ ! -f "wp-config.php" ] && [ ! -f "wp-load.php" ]; then
  echo "⬇️ Téléchargement de WordPress..."
  wp core download
fi

# Créer le wp-config si besoin
if [ ! -f "wp-config.php" ]; then
  echo "⚙️ Création du fichier wp-config.php..."
  wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --skip-check
fi

# Installer WordPress si pas encore installé
if ! wp core is-installed > /dev/null 2>&1; then
  echo "🚀 Installation de WordPress..."
  wp core install \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email
else
  echo "✅ WordPress est déjà installé."
fi

echo "🎉 Installation terminée."
