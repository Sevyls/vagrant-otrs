VERSION="4.0.3" # OTRS

echo "apt-get update..."
sudo apt-get update > /dev/null
echo "apt-get install..."
sudo apt-get install -y build-essential apache2 perl libapache2-mod-perl2 \
postgresql libdigest-perl libdigest-md5-file-perl libarchive-zip-perl \
libcrypt-eksblowfish-perl libdbi-perl libdbd-pg-perl libjson-xs-perl \
libnet-dns-perl libtemplate-perl libtext-csv-xs-perl libxml-parser-perl \
libyaml-libyaml-perl > /dev/null

echo "Download otrs..."
wget –q "http://ftp.otrs.org/pub/otrs/otrs-$VERSION.tar.bz2" > /dev/null
echo "extract otrs..."
tar xjf otrs-$VERSION.tar.bz2 > /dev/null
sudo mv otrs-$VERSION /opt/otrs

echo "Add otrs user..."
sudo useradd -d /opt/otrs/ -c 'OTRS user' otrs
sudo usermod -G www-data otrs

cd /opt/otrs/
cp Kernel/Config.pm.dist Kernel/Config.pm
cp Kernel/Config/GenericAgent.pm.dist Kernel/Config/GenericAgent.pm
echo "Check perl dependencies"
sudo perl /opt/otrs/bin/otrs.CheckModules.pl
sudo perl -cw /opt/otrs/bin/cgi-bin/index.pl
sudo perl -cw /opt/otrs/bin/cgi-bin/customer.pl
sudo perl -cw /opt/otrs/bin/otrs.PostMaster.pl
bin/otrs.SetPermissions.pl --web-group=www-data
sudo cp /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/conf.d/otrs.conf
sudo service apache2 restart
