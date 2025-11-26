# WordPress Dev Boilerplate (Docker + WP-CLI)

Environnement de développement WordPress prêt à l'emploi avec Docker, MySQL,
Apache et WP-CLI. Idéal pour développer des thèmes et plugins, avec uniquement
le dossier `wp-content` versionné dans Git.

## 🧱 Stack technique

- Docker & Docker Compose
- MySQL 8
- WordPress (image officielle `wordpress:php8.2-apache`)
- WP-CLI (image officielle `wordpress:cli-php8.2`)
- macOS (mais fonctionne aussi sur Linux/Windows avec Docker)

## 📁 Structure du projet

```text
wp-dev-docker-boilerplate/
├─ docker-compose.yml
├─ .env                  # config base de données + WordPress (non versionné)
├─ bin/
│  └─ wp-install.sh      # script d'installation automatique via WP-CLI
└─ wp-content/
   ├─ themes/            # vos thèmes personnalisés
   └─ plugins/           # vos plugins personnalisés
