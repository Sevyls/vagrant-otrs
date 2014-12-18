# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> Most OTRS configuration should be done via the OTRS web interface
#       and the SysConfig. Only for some configuration, such as database
#       credentials and customer data source changes, you should edit this
#       file. For changes do customer data sources you can copy the definitions
#       from Kernel/Config/Defaults.pm and paste them in this file.
#       Config.pm will not be overwritten when updating OTRS.
# --

package Kernel::Config;

use strict;
use warnings;
use utf8;

sub Load {
  my $Self = shift;

  # ---------------------------------------------------- #
  # database settings                                    #
  # ---------------------------------------------------- #

  # The database host
  $Self->{DatabaseHost} = '127.0.0.1';

  # The database name
  $Self->{Database} = 'otrs';

  # The database user
  $Self->{DatabaseUser} = 'otrs';

  # The password of database user. You also can use bin/otrs.CryptPassword.pl
  # for crypted passwords
  $Self->{DatabasePw} = 'otrspassword';

  # The database DSN for PostgreSQL ==> more: "perldoc DBD::Pg"
  $Self->{'DatabaseDSN'} = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost}";

  # ---------------------------------------------------- #
  # fs root directory
  # ---------------------------------------------------- #
  $Self->{Home} = '/opt/otrs';

  # ---------------------------------------------------- #
  # insert your own config settings "here"               #
  # config settings taken from Kernel/Config/Defaults.pm #
  # ---------------------------------------------------- #
  # $Self->{SessionUseCookie} = 0;
  # $Self->{CheckMXRecord} = 0;

  # ---------------------------------------------------- #

  # ---------------------------------------------------- #
  # data inserted by installer                           #
  # ---------------------------------------------------- #
  # $DIBI$

  # ---------------------------------------------------- #
  # ---------------------------------------------------- #
  #                                                      #
  # end of your own config options!!!                    #
  #                                                      #
  # ---------------------------------------------------- #
  # ---------------------------------------------------- #
}

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #

use base qw(Kernel::Config::Defaults);

# -----------------------------------------------------#

1;
