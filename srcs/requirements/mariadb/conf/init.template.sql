CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
USE ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS "${MYSQL_ADMIN}"@'%' IDENTIFIED BY "${MYSQL_ADMIN_PASSWORD}";
CREATE USER IF NOT EXISTS "${MYSQL_USER}"@'%' IDENTIFIED BY "${MYSQL_USER_PASSWORD}";
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO "${MYSQL_ADMIN}"@'%';
GRANT SELECT, INSERT, UPDATE ON ${MYSQL_DATABASE}.* TO "${MYSQL_USER}"@'%';
FLUSH PRIVILEGES;


-- INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status, display_name)
-- VALUES (${MYSQL_ADMIN}, MD5(${MYSQL_ADMIN_PASSWORD}), ${MYSQL_ADMIN}, ${MAINTAINER}, NOW(), 0, ${MYSQL_ADMIN});

-- SET @admin_id = LAST_INSERT_ID();

-- INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (@admin_id, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
-- INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (@admin_id, 'wp_user_level', '10');


-- INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status, display_name)
-- VALUES (${MYSQL_USER}, MD5(${MYSQL_USER_PASSWORD}), ${MYSQL_USER}, ${MAINTAINER}, NOW(), 0, ${MYSQL_USER});

-- SET @editor_id = LAST_INSERT_ID();

-- INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (@editor_id, 'wp_capabilities', 'a:1:{s:6:"editor";b:1;}');
-- INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (@editor_id, 'wp_user_level', '7');
-- FLUSH PRIVILEGES;
