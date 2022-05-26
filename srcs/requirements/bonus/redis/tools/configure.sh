if [ ! -f "/etc/redis/redis.conf.bak" ]; then

	cp /etc/redis/redis.conf /etc/redis/redis.conf.bak

	# Чтобы изменить IP-адрес во всех файлах зоны, используйте следующую команду:
	# -i изменить файл на месте s означает замену
	sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
	# измените foobared на свой пароль
	# sed -i "s|# requirepass foobared|requirepass $REDIS_PWD|g" /etc/redis.conf
	# Когда память вашего экземпляра Redis заполнена и поступает новая запись, 
	# Redis вытесняет ключи, чтобы освободить место для записи, в соответствии с политикой maxmemory вашего экземпляра
	sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
	# noevicrion
	# Эта политика вытеснения говорит Redis не удалять данные при достижении предела памяти. 
	# Вместо этого Redis вернет ошибку и не сможет выполнить команду добавления данных.
	# Эта политика особенно применима, когда вам нужно удалить ключи вручную или 
	# предотвратить случайную потерю данных.
	# Allkeys-LRU
	# Вторая политика — allkeys-lru. Этот тип политики вытесняет любой последний использованный ключ или LRU.
	# Эта политика предполагает, что вам не нужны недавно использованные ключи, и удаляет их. 
	# Это предотвращает ошибку Redis в случае ограничения памяти.
	sed -i "s|# maxmemory-policy noevicrion|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

fi

# Сервер Redis вернет ошибку любому клиенту, подключающемуся к внешним петлевым адресам в защищенном режиме
redis-server --protected-mode no