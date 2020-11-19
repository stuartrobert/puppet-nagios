# Nagios Server class
#
class nagios::server (
  # For the tag of the stored configuration to realize
  $nagios_server        = 'default',
  $apache_httpd         = true,
  $apache_httpd_ssl     = true,
  $apache_httpd_modules = [
    'auth_basic',
    'authn_file',
    'authz_host',
    'authz_user',
    'env',
    'mime',
    'negotiation',
    'dir',
    'alias',
    'rewrite',
    'cgi',
  ],
  # The apache config snippet, more useful as a template when using a custom
  $apache_httpd_conf_content    = undef,
  $apache_httpd_conf_source     = undef,
  $apache_allowed_from          = [],   # Allow access in default template
  $apache_httpd_htpasswd_source = "puppet:///modules/${module_name}/apache_httpd/htpasswd",
  $php                          = true,
  $php_apc                      = true,
  $php_apc_module               = 'pecl-apc',
  # cgi.cfg
  $cgi_authorized_for_system_information        = 'nagiosadmin',
  $cgi_authorized_for_configuration_information = 'nagiosadmin',
  $cgi_authorized_for_system_commands           = 'nagiosadmin',
  $cgi_authorized_for_all_services              = 'nagiosadmin',
  $cgi_authorized_for_all_hosts                 = 'nagiosadmin',
  $cgi_authorized_for_all_service_commands      = 'nagiosadmin',
  $cgi_authorized_for_all_host_commands         = 'nagiosadmin',
  $cgi_default_statusmap_layout                 = '5',
  $cgi_result_limit                             = '100',
  # mail server installation is optionnal
  $mailx_install                = true,
  # nagios.cfg
  $cfg_file = [
    # Where puppet managed types are
    '/etc/nagios/nagios_command.cfg',
    '/etc/nagios/nagios_contact.cfg',
    '/etc/nagios/nagios_contactgroup.cfg',
    '/etc/nagios/nagios_host.cfg',
    '/etc/nagios/nagios_hostdependency.cfg',
    '/etc/nagios/nagios_hostgroup.cfg',
    '/etc/nagios/nagios_service.cfg',
    '/etc/nagios/nagios_servicedependency.cfg',
    '/etc/nagios/nagios_servicegroup.cfg',
    '/etc/nagios/nagios_timeperiod.cfg',
    '/etc/nagios/nagios_hostescalation.cfg',
    '/etc/nagios/nagios_serviceescalation.cfg',
  ],
  $cfg_dir                        = [],
  $cfg_template                   = $::nagios::params::cfg_template,
  $process_performance_data       = '0',
  $host_perfdata_command          = false,
  $service_perfdata_command       = false,
  $service_perfdata_file          = false,
  $service_perfdata_file_template = '[SERVICEPERFDATA]\t$TIMET$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$',
  $service_perfdata_file_mode     = 'a',
  $service_perfdata_file_processing_interval = '0',
  $service_perfdata_file_processing_command  = false,
  $enable_flap_detection = '1',
  $date_format = 'iso8601',
  $admin_email = 'root@localhost',
  $admin_pager = 'pagenagios@localhost',
  $cfg_append  = undef,
  $service_check_timeout = '60',
  $host_check_timeout    = '30',
  $event_handler_timeout = '30',
  $notification_timeout  = '30',
  $ocsp_timeout          = '5',
  $perfdata_timeout      = '5',
  $enable_notifications  = '1',
  # private/resource.cfg for $USERx$ macros (from 1 to 32)
  $user = {
    '1' => $::nagios::params::plugin_dir,
  },
  # Command and options for all nrpe-based checks
  $nrpe_command   = $::nagios::params::nrpe_command,
  $nrpe_options   = $::nagios::params::nrpe_options,
  # Contacts and Contact Groups
  $admins_members = 'nagiosadmin',
  # Others
  $notify_host_by_email_command_line    = '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **" $CONTACTEMAIL$',
  $notify_service_by_email_command_line = '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
  $timeperiod_workhours  = '09:00-17:00',
  $plugin_dir            = $::nagios::params::plugin_dir,
  $plugin_nginx          = false,
  $plugin_xcache         = false,
  $plugin_slack          = false,
  $plugin_slack_domain   = undef,
  $plugin_slack_token    = undef,
  $plugin_redis          = false,
  $plugin_redis_sentinel = false,
  $selinux               = $::selinux,
  $check_for_updates     = true,
  # Original template entries
  $template_generic_contact = {},
  $template_generic_host    = {},
  $template_linux_server    = {},
  $template_windows_server  = {},
  $template_generic_printer = {},
  $template_generic_switch  = {},
  $template_generic_service = {},
  $template_local_service   = {},
  # Optional types
  $commands         = {},
  $contacts         = {},
  $contactgroups    = {},
  $hosts            = {},
  $hostdependencies = {},
  $hostgroups       = {},
  $services         = {},
  $servicegroups    = {},
  $timeperiods      = {},
  # Escalation rules
  $hostescalation    = {},
  $serviceescalation = {},
) inherits ::nagios::params {

  # Full nrpe command to run, with default options
  $nrpe = "${nrpe_command} ${nrpe_options}"

  # Plugin packages required on the server side
  $srv_packages = [
    'nagios',
    'nagios-plugins-dhcp',
    'nagios-plugins-dns',
    'nagios-plugins-icmp',
    'nagios-plugins-ldap',
    'nagios-plugins-nrpe',
    'nagios-plugins-ping',
    'nagios-plugins-smtp',
    'nagios-plugins-snmp',
    'nagios-plugins-ssh',
    'nagios-plugins-tcp',
  ]
  ensure_packages($srv_packages, {ensure => installed, })

  # Plugin packages required on both the client and server sides
  Package <| tag == 'nagios-plugins-http' |>

  # Custom plugin scripts required on the server
  if $plugin_nginx {
    file { "${plugin_dir}/check_nginx":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('nagios/plugins/check_nginx'),
    }
  } else {
    file { "${plugin_dir}/check_nginx":
      ensure => absent,
    }
  }
  if $plugin_xcache {
    file { "${plugin_dir}/check_xcache":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('nagios/plugins/check_xcache'),
    }
  } else {
    file { "${plugin_dir}/check_xcache":
      ensure => absent,
    }
  }
  if $plugin_slack {
    if ! $plugin_slack_domain or ! $plugin_slack_token {
      fail('$plugin_slack_domain and $plugin_slack_token must be pass when $plugin_slack is enabled.')
    }
    ensure_packages(
      [
        'perl(LWP::Protocol::https)',
        'perl(IO::Socket::SSL)',
      ]
    )
    file { "${plugin_dir}/slack_nagios":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('nagios/plugins/slack_nagios'),
    }
  } else {
    file { "${plugin_dir}/slack_nagios":
      ensure => 'absent',
    }
  }

  if $plugin_redis {
    file { "${plugin_dir}/check_redis":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('nagios/plugins/check_redis'),
    }
    package { 'perl-Redis' : ensure => present }
  } else {
    file { "${plugin_dir}/check_redis":
      ensure => 'absent',
    }
    package { 'perl-Redis' : ensure => absent }
  }

  if $plugin_redis_sentinel {
    file { "${plugin_dir}/check_sentinel_master_health":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('nagios/plugins/check_sentinel_master_health'),
    }
    package { 'rubygem-redis' : ensure => present }
  } else {
    file { "${plugin_dir}/check_sentinel_master_health":
      ensure => 'absent',
    }
    package { 'rubygem-redis' : ensure => absent }
  }

  # Other packages
  # For the default email notifications to work
  if $mailx_install {
    ensure_packages(['mailx'])
  }

  service { 'nagios':
    ensure    => 'running',
    enable    => true,
    # "service nagios status" returns 0 when "nagios is not running" :-(
    hasstatus => false,
    # Don't get fooled by any process with "nagios" in its command line
    pattern   => '/usr/sbin/nagios',
    # Work around files created root:root mode 600 (known issue)
    restart   => '/bin/chgrp nagios /etc/nagios/nagios_*.cfg && /bin/chmod 640 /etc/nagios/nagios_*.cfg && /bin/kill -HUP `cat /var/run/nagios/nagios.pid`',
    require   => Package['nagios'],
  }

  if $apache_httpd {
    class { '::apache_httpd':
      ssl       => $apache_httpd_ssl,
      modules   => $apache_httpd_modules,
      keepalive => 'On',
    }

    # Set a default content template if no content/source is specified
    if $apache_httpd_conf_source == undef {
      if $apache_httpd_conf_content == undef {
        $apache_httpd_conf_content_final = template("${module_name}/apache_httpd/httpd-nagios.conf.erb")
      } else {
        $apache_httpd_conf_content_final = $apache_httpd_conf_content
      }
    }
    file { '/etc/httpd/conf.d/nagios.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $apache_httpd_conf_content_final,
      source  => $apache_httpd_conf_source,
      notify  => Service['httpd'],
      require => Package['nagios'],
    }
    if $apache_httpd_htpasswd_source != false {
      file { '/etc/nagios/.htpasswd':
        owner   => 'root',
        group   => 'apache',
        mode    => '0640',
        source  => $apache_httpd_htpasswd_source,
        require => Package['nagios'],
      }
    }
  }

  if $php {
    class { '::php::mod_php5': }
    php::ini { '/etc/php.ini':
      date_timezone => 'Etc/UTC',
    }
    if $php_apc { php::module { $php_apc_module: } }
  }

  # Configuration files
  if ($cfg_append != undef) {
    validate_hash($cfg_append)
  }
  file { '/etc/nagios/cgi.cfg':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nagios/cgi.cfg.erb'),
    # No need to reload the service, changes are applied immediately
    require => Package['nagios'],
  }
  file { '/etc/nagios/nagios.cfg':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($cfg_template),
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  file { '/etc/nagios/private/resource.cfg':
    owner   => 'root',
    group   => 'nagios',
    mode    => '0640',
    content => template('nagios/resource.cfg.erb'),
    notify  => Service['nagios'],
    require => Package['nagios'],
  }

  # Realize all nagios related exported resources for this server
  # Automatically reload nagios for relevant configuration changes
  # Require the package for the parent directory to exist initially
  Nagios_command <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_contact <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_contactgroup <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_host <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostdependency <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostgroup <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_service <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_servicedependency <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_servicegroup <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_timeperiod <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostescalation <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_serviceescalation <<| tag == "nagios-${nagios_server}" |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }

  # Auto reload and parent dir, but for non-exported resources
  # FIXME: This does not work from outside here, wrong scope.
  # We'll need to wrap around these types with our own
  # definitions like for "host"
  Nagios_command {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_contact {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_contactgroup {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_host {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostdependency {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostgroup {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_service {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_servicegroup {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_timeperiod {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_hostescalation {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }
  Nagios_serviceescalation {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }

  # Works great, but only if the "target" is the default (known limitation)
  resources { [
    'nagios_command',
    'nagios_contact',
    'nagios_contactgroup',
    'nagios_host',
    'nagios_hostdependency',
    'nagios_hostgroup',
    'nagios_service',
    'nagios_servicegroup',
    'nagios_timeperiod',
    'nagios_hostescalation',
    'nagios_serviceescalation',
  ]:
    purge => true,
  }

  # Work around a puppet bug where created files are 600 root:root
  # Also, restart service after resources are purged
  file { [
    '/etc/nagios/nagios_command.cfg',
    '/etc/nagios/nagios_contact.cfg',
    '/etc/nagios/nagios_contactgroup.cfg',
    '/etc/nagios/nagios_host.cfg',
    '/etc/nagios/nagios_hostdependency.cfg',
    '/etc/nagios/nagios_hostgroup.cfg',
    '/etc/nagios/nagios_service.cfg',
    '/etc/nagios/nagios_servicedependency.cfg',
    '/etc/nagios/nagios_servicegroup.cfg',
    '/etc/nagios/nagios_timeperiod.cfg',
    '/etc/nagios/nagios_hostescalation.cfg',
    '/etc/nagios/nagios_serviceescalation.cfg',
  ]:
    ensure => 'present',
    owner  => 'root',
    group  => 'nagios',
    mode   => '0640',
    audit  => 'content',
    notify => Service['nagios'],
  }

  # Collect virtual resources from check_service
  Nagios_command <<| tag == 'service' |>> {
    notify  => Service['nagios'],
    require => Package['nagios'],
  }

  # Nagios contacts and contactgroups
  # Taken from contacts.cfg
  nagios_contact { 'nagiosadmin':
    use   => 'generic-contact',
    alias => 'Nagios Admin',
    email => $admin_email,
  }
  nagios_contactgroup { 'admins':
    alias   => 'Nagios Administrators',
    members => $admins_members,
  }


  # Create all resources for nagios types
  create_resources (nagios_command, $commands)
  create_resources (nagios_contact, $contacts)
  create_resources (nagios_contactgroup, $contactgroups)
  create_resources (nagios_host, $hosts)
  create_resources (nagios_hostdependency, $hostdependencies)
  create_resources (nagios_hostgroup, $hostgroups)
  create_resources (nagios_service, $services)
  create_resources (nagios_servicegroup, $servicegroups)
  create_resources (nagios_timeperiod, $timeperiods)
  create_resources (nagios_hostescalation, $hostescalation)
  create_resources (nagios_serviceescalation, $serviceescalation)

  # With selinux, adjustements are needed for nagiosgraph
  # lint:ignore:quoted_booleans
  if ( ( $selinux == true and $::selinux_enforced == true ) or
  ( $selinux == 'true' and $::selinux_enforced == 'true' ) ) {
    selinux::audit2allow { 'nagios':
      source => "puppet:///modules/${module_name}/messages.nagios",
    }
  }
  # lint:endignore

}
