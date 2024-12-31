#!/bin/bash

# Update the package list
apt update -y

# Install Apache (httpd)
if ! command -v apache2 &> /dev/null; then
    echo "Installing Apache..."
    apt install -y apache2
fi

# Get the hostname of the machine
HOSTNAME=$(hostname)

# Create a simple HTML file 
echo "<html>
<head><title>Welcome</title></head>
<body>
<h1>Hello $HOSTNAME, welcome to my webserver</h1>
</body>
</html>" > /var/www/html/index.html

# Start the Apache service
systemctl start apache2
systemctl enable apache2

echo "HTTP server setup complete. Visit your web server to see the message."
