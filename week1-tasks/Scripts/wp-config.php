<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress_db');

/** MySQL database username */
define('DB_USER', 'Admin');

/** MySQL database password */
define('DB_PASSWORD', 'Admin@123');

/** MySQL hostname - Use the private IP of your MySQL EC2 instance */
define('DB_HOST', '10.0.1.208'); // Replace with the private IP of your MySQL instance

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the WordPress.org secret-key service
 * @see https://api.wordpress.org/secret-key/1.1/salt/
 * You can change these at any point in time to invalidate all existing cookies.
 */
define('AUTH_KEY',         'your_unique_phrase');
define('SECURE_AUTH_KEY',  'your_unique_phrase');
define('LOGGED_IN_KEY',    'your_unique_phrase');
define('NONCE_KEY',        'your_unique_phrase');
define('AUTH_SALT',        'your_unique_phrase');
define('SECURE_AUTH_SALT', 'your_unique_phrase');
define('LOGGED_IN_SALT',   'your_unique_phrase');
define('NONCE_SALT',       'your_unique_phrase');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique prefix.
 * Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
