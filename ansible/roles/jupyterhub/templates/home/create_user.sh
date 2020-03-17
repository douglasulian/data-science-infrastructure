exists=$(grep -c "^$1:" /etc/passwd)

if [ $exists -eq 0 ]; then
    adduser --gecos --quiet --disabled-password $1
    echo 'oi'
fi
