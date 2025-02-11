define( 'DB_NAME', 'mariadb' );
define( 'DB_USER', 'wp_nimda' );
define( 'DB_PASSWORD', 'administrator' );
define( 'DB_HOSTNAME', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
