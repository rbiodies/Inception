if [ ! -f "/etc/vsftpd.conf.bak" ]; then

	mkdir -p /var/run/vsftpd/empty

	cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
	mv /var/www/vsftpd.conf /etc/vsftpd.conf

	# Добавьте FTP_USER, измените его пароль и объявите его владельцем папки wordpress и всех подпапок
	adduser $FTP_USR --disabled-password
	echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USR:$FTP_USR /var/www/html/wordpress

	# dev/null выглядит пустым при чтении из него, тогда как данные, записанные на это устройство, просто «исчезают».
	echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

fi

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd.conf