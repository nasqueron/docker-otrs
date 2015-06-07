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

    $Self->{DatabaseHost} = 'mysql';
    $Self->{Database} = '%%DATABASE%%';
    $Self->{DatabaseUser} = 'otrs';
    $Self->{DatabasePw} = 'otrs';
    $Self->{DatabaseDSN} = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost};";

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #

    $Self->{Home} = '/opt/otrs/';

    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
    # config settings taken from Kernel/Config/Defaults.pm #
    # ---------------------------------------------------- #
    # $Self->{SessionUseCookie} = 0;
    # $Self->{CheckMXRecord} = 0;
 
    $Self->{'SecureMode'} = 1;
    $Self->{'CheckEmailAddresses'} = 0;
    $Self->{'CheckMXRecord'}       = 0;
    $Self->{'Organization'}        = '';
    $Self->{'LogModule'}           = 'Kernel::System::Log::File';
    $Self->{'LogModule::LogFile'}  = '/tmp/otrs.log';
    $Self->{'DefaultLanguage'}     = 'en';
    $Self->{'DefaultCharset'}      = 'utf-8';
    $Self->{'AdminEmail'}          = 'root@localhost';
    $Self->{'Package::Timeout'}    = '120';

    # Misc
    $Self->{'Loader::Enabled::CSS'}  = 0;
    $Self->{'Loader::Enabled::JS'}   = 0;
    $Self->{'FAQ::Item::Field1'} =  {
      'Caption' => 'Symptom',
      'Prio' => '100',
      'Show' => 'false'
    };

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
