<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'w+Jx>P+b!(DsIdW(fHSHfqz[9mvWXItT8Tx;orf#Qh<pY.I5smw1^u-WWUjGocaA' );
define( 'SECURE_AUTH_KEY',  'FOsJ^imjt?o2LY8 GYJO*VT+7T+5v7P(0n|*o*GET~zO0*0KAe7%8iNp,x7_FPX$' );
define( 'LOGGED_IN_KEY',    'tQ;&;%D0#TDszV2O[ /=9vN~{>p,:i;IXvlyd>Jx0R.#WiE.5!v;))u3wpx@aYQ3' );
define( 'NONCE_KEY',        'D$E]bhgj1GxV5tSMre&]C8%iWcoL++d-?njB)^_ZmXBxKypQo>sNOsHQ8tg+D{T3' );
define( 'AUTH_SALT',        'e2YZ%D[RH$/&{w+R-X-0?owt@@sOiZ=@un=hiz4wPJ-nkR 8A}LNtds`Lw8rv%5q' );
define( 'SECURE_AUTH_SALT', '8E>+P*zqp^>HqE#5&F6ng|_TIvf9Wohb>GNb;:1hHHSf,5Psagky/y}Td0@l%<P{' );
define( 'LOGGED_IN_SALT',   '%NM+N?Vz}@)V#k/p7O-fAR[u-F6{/,]M-]rD,`gE6)t80fr`jS!?sv&-wXYe_S`%' );
define( 'NONCE_SALT',       '&4x561pXF6W)uf]i^3xstS6[#%rr,wyUXqN.Bsde,GNIWmOi)H0#m3YM?`~fFL%7' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

