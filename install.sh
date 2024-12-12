#!/bin/bash

# Constants
WP_CLI="../bin/wp-cli.phar"

# Configuration variables
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASS="dbpass"
SITE_URL="woo.tobeworks.de"

# Admin configuration
ADMIN_USER="admin"
ADMIN_PASS="changethat"
ADMIN_EMAIL="hallo@tobeworks.de"

# Second admin
ADMIN2_USER="Test"
ADMIN2_EMAIL="test@test.tdl"
ADMIN2_PASS="changethat"

# Fallback theme if Divi is not available
FALLBACK_THEME="twentytwentyfour"

# Enable error handling
set -e


check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}


if [ ! -f "$WP_CLI" ]; then
    echo "wp-cli not found at $WP_CLI"
    exit 1
fi

# WordPress Installation
echo "Starting WordPress installation..."

php "$WP_CLI" core download --locale=de_DE
check_command "Failed to download WordPress core"

php "$WP_CLI" config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASS" \
    --locale=de_DE
check_command "Failed to create wp-config.php"

php "$WP_CLI" core install \
    --url="$SITE_URL" \
    --title="WordPress" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASS" \
    --admin_email="$ADMIN_EMAIL"
check_command "Failed to install WordPress"


echo "Creating second admin user..."
php "$WP_CLI" user create \
    "$ADMIN2_USER" \
    "$ADMIN2_EMAIL" \
    --role=administrator \
    --user_pass="$ADMIN2_PASS"
check_command "Failed to create second admin user"

echo "Installing WooCommerce..."
php "$WP_CLI" plugin install woocommerce --activate
check_command "Failed to install WooCommerce"


echo "Setting up WooCommerce..."
php "$WP_CLI" wc shop install \
    --user="$ADMIN_USER" \
    --country=DE \
    --city="Berlin" \
    --currency=EUR
check_command "Failed to setup WooCommerce"

echo "Installing theme..."
if [ -f "./bin/Divi.zip" ]; then
    echo "Installing Divi theme..."
    php "$WP_CLI" theme install "./bin/Divi.zip" --activate
    check_command "Failed to install Divi theme"
else
    echo "Divi theme not found, installing $FALLBACK_THEME instead..."
    php "$WP_CLI" theme install $FALLBACK_THEME --activate
    check_command "Failed to install fallback theme"
fi


echo "Installing additional plugins..."
ACTIVE_PLUGINS=(
    "query-monitor"
    "woocommerce-germanized"  # Optional: for German shops
)

for plugin in "${ACTIVE_PLUGINS[@]}"; do
    echo "Installing plugin: $plugin"
    php "$WP_CLI" plugin install "$plugin" --activate
    check_command "Failed to install plugin: $plugin"
done


echo "Configuring WooCommerce settings..."
php "$WP_CLI" option update woocommerce_default_country 'DE'
php "$WP_CLI" option update woocommerce_currency 'EUR'
php "$WP_CLI" option update woocommerce_currency_pos 'right_space'
php "$WP_CLI" option update woocommerce_price_thousand_sep '.'
php "$WP_CLI" option update woocommerce_price_decimal_sep ','


echo "Cleaning up..."
php "$WP_CLI" post delete $(php "$WP_CLI" post list --post_type=post --format=ids) --force
php "$WP_CLI" post delete $(php "$WP_CLI" post list --post_type=page --format=ids) --force

echo "Installation completed successfully!"
echo "WooCommerce shop is now set up at $SITE_URL"
exit 0
