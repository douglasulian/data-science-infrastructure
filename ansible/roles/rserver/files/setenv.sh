echo 'Acquire{' > /etc/apt/apt.conf
echo 'HTTP::proxy "http://10.240.68.68:3128";' >> /etc/apt/apt.conf
echo 'FTP::proxy "http://10.240.68.68:3128";' >> /etc/apt/apt.conf
echo '}' >> /etc/apt/apt.conf
echo 'HTTP_PROXY=10.240.68.68:3128' >> /usr/local/lib/R/etc/Renviron
echo 'HTTPS_PROXY=10.240.68.68:3128' >> /usr/local/lib/R/etc/Renviron
