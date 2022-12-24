
[{{username}}]


user = {{username}}
group = {{username}}
listen = /var/run/php/{{username}}-php-fpm.sock
listen.owner = {{username}}
listen.group = {{username}}
listen.mode = 0660

chroot = /var/www/

pm = dynamic
pm.max_children = 5
pm.start_servers = 3
pm.min_spare_servers = 2
pm.max_spare_servers = 4
pm.max_requests = 500
pm.process_idle_timeout = 5s


php_admin_value[error_log] = /home/{{username}}/logs/php/php-fpm-www-errors.log
php_admin_flag[log_errors] = on
php_admin_value[memory_limit] = 128M
php_admin_value[upload_max_filesize] = 256M
php_admin_value[post_max_size] = 258M
php_admin_value[session.save_path] = /home/{{username}}/tmp/
php_admin_value[sys_temp_dir] = /home/{{username}}/tmp/
php_admin_flag[session.use_trans_sid]=Off
php_admin_flag[allow_url_fopen]=Off
php_admin_flag[allow_url_include]=Off

;Opcache Settings
php_admin_flag[opcache.enable]=1
php_admin_value[opcache.memory_consumption]=64
php_admin_value[opcache.interned_strings_buffer]=16
php_admin_value[opcache.max_accelerated_files]=65536
php_admin_flag[opcache.use_cwd]=1
php_admin_flag[opcache.validate_timestamps]=1

php_admin_value[opcache.revalidate_freq]=2
php_admin_value[opcache.save_comments]=0
php_admin_value[opcache.fast_shutdown]=1
php_admin_value[opcache.force_restart_timeout]=30

[global]
emergency_restart_threshold = 10
emergency_restart_interval = 1m
process_control_timeout = 10s
error_log = /var/log/php-{{username}}-fpm-errors.log