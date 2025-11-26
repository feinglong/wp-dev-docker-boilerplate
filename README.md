# WordPress Dev Boilerplate (Docker + WP-CLI)

A ready-to-use WordPress development environment powered by **Docker**, **MySQL**, **Apache**, and **WP-CLI**.
Perfect for developing custom **themes** and **plugins**, with only the `wp-content` folder versioned in Git.

---

## 🧱 Tech Stack

- Docker & Docker Compose
- MySQL 8
- WordPress (official image `wordpress:php8.2-apache`)
- WP-CLI (official image `wordpress:cli-php8.2`)
- macOS (also works on Linux/Windows with Docker)

---

## 📁 Project Structure

```
wp-dev-docker-boilerplate/
├─ docker-compose.yml
├─ .env                  # Database + WordPress config (not versioned)
├─ bin/
│  └─ wp-install.sh      # Automatic WordPress install script via WP-CLI
└─ wp-content/
   ├─ themes/            # Your custom themes
   └─ plugins/           # Your custom plugins
```

---

## 🐳 Useful Docker Commands

### ▶️ Start the WordPress environment
Starts all containers (MySQL, WordPress, WP-CLI) in the background:

```bash
docker-compose up -d
```

---

### ⏹️ Stop all containers

```bash
docker-compose down
```

---

### 🔁 Restart containers (without recreating them)

```bash
docker-compose restart
```

---

### 📋 List running containers

```bash
docker-compose ps
```

---

### 📄 View WordPress container logs

```bash
docker-compose logs -f wordpress
```

---

### 🧹 Remove containers + network (keeps database volume)

```bash
docker-compose down
```

---

### 🔥 Remove containers + volumes (⚠️ deletes the database)

```bash
docker-compose down -v
```

---

### 🧪 Enter the WordPress container (Bash shell)

```bash
docker-compose exec wordpress bash
```

---

### 🧪 Enter the WP-CLI container

```bash
docker-compose run --rm wpcli bash
```

---

### 🚀 Install WordPress via WP-CLI

```bash
docker-compose run --rm wpcli bash bin/wp-install.sh
```

---

## 🧼 Full Cleanup (reset WordPress without touching wp-content)

Inside the WP-CLI container:

```bash
docker-compose run --rm wpcli bash
```

Then inside the shell:

```bash
rm -rf wp-admin wp-includes wp-*.php index.php license.txt readme.html xmlrpc.php
exit
```

Reinstall WordPress:

```bash
docker-compose run --rm wpcli bash bin/wp-install.sh
```

---