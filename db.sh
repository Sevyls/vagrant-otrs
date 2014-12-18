sudo mv Config.pm /opt/otrs/Kernel/Config.pm
sudo chown otrs:www-data /opt/otrs/Kernel/Config.pm
sudo chmod 770 /opt/otrs/Kernel/Config.pm
echo "Creating empty database..."
sudo su - postgres <<POSTGRES
echo "create user otrs password 'otrspassword';alter user otrs createdb;CREATE DATABASE otrs owner otrs;" | psql > /dev/null
POSTGRES

# TODO Automatic installation
#sudo su - otrs <<OTRS
#echo "Loading sql scripts into database..."
#cd /opt/otrs/scripts/database/
#psql < otrs-schema.postgresql.sql > /dev/null
#psql < otrs-initial_insert.postgresql.sql > /dev/null
#echo "Done."
#OTRS
