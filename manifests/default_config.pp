# the default server config components
class nagios::default_config(
) {

  # Nagios commands
  # Taken from commands.cfg
  nagios_command { 'notify-host-by-email':
    command_line => $notify_host_by_email_command_line,
  }
  nagios_command { 'notify-service-by-email':
    command_line => $notify_service_by_email_command_line,
  }
  nagios_command { 'check-host-alive':
    command_line => '$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 5',
  }
  nagios_command { 'check_ftp':
    command_line => '$USER1$/check_ftp -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_hpjd':
    command_line => '$USER1$/check_hpjd -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_snmp':
    command_line => '$USER1$/check_snmp -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_http':
    command_line => '$USER1$/check_http -I $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_ssh':
    command_line => '$USER1$/check_ssh $ARG1$ $HOSTADDRESS$',
  }
  nagios_command { 'check_dhcp':
    command_line => '$USER1$/check_dhcp $ARG1$',
  }
  nagios_command { 'check_ping':
    command_line => '$USER1$/check_ping -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_ping6':
    command_line => '$USER1$/check_ping -6 $ARG1$',
  }
  nagios_command { 'check_pop':
    command_line => '$USER1$/check_pop -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_imap':
    command_line => '$USER1$/check_imap -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_smtp':
    command_line => '$USER1$/check_smtp -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_tcp':
    command_line => '$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$ $ARG2$',
  }
  nagios_command { 'check_udp':
    command_line => '$USER1$/check_udp -H $HOSTADDRESS$ -p $ARG1$ $ARG2$',
  }
  nagios_command { 'check_nt':
    command_line => '$USER1$/check_nt -H $HOSTADDRESS$ -p 12489 -v $ARG1$ $ARG2$',
  }
  # Custom commands
  nagios_command { 'check_ping_addr':
    command_line => '$USER1$/check_ping -H $ARG1$ -w $ARG2$ -c $ARG3$ -p 5',
  }
  nagios_command { 'check_dns':
    command_line => '$USER1$/check_dns -H $HOSTADDRESS$ $ARG1$',
  }
  nagios_command { 'check_dns_addr':
    command_line => '$USER1$/check_dns -H $ARG1$ $ARG2$',
  }
  nagios_command { 'check_http_url':
    command_line => '$USER1$/check_http -H $ARG1$ -p $ARG2$ $ARG3$',
  }
  nagios_command { 'check_proxy':
    command_line => '$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$',
  }
  nagios_command { 'check_nginx':
    command_line => '$USER1$/check_nginx $ARG1$',
  }
  nagios_command { 'check_redis':
    command_line => '$USER1$/check_redis $ARG1$',
  }
  nagios_command { 'check_redis_sentinel':
    command_line => '$USER1$/check_sentinel_master_health $ARG1$',
  }

  # Custom NRPE-based commands
  nagios_command { 'check_nrpe_users':
    command_line => "${nrpe} -c check_users",
  }
  nagios_command { 'check_nrpe_load':
    command_line => "${nrpe} -c check_load",
  }
  nagios_command { 'check_nrpe_zombie_procs':
    command_line => "${nrpe} -c check_zombie_procs",
  }
  nagios_command { 'check_nrpe_total_procs':
    command_line => "${nrpe} -c check_total_procs",
  }
  nagios_command { 'check_nrpe_swap':
    command_line => "${nrpe} -c check_swap",
  }
  nagios_command { 'check_nrpe_disk':
    command_line => "${nrpe} -c check_disk",
  }
  nagios_command { 'check_nrpe_procs':
    command_line => "${nrpe} -c check_procs",
  }
  nagios_command { 'check_nrpe_ntp_time':
    command_line => "${nrpe} -u -c check_ntp_time",
  }
  # Custom NRPE-based commands using custom plugins
  nagios_command { 'check_nrpe_ram':
    command_line => "${nrpe} -c check_ram",
  }
  nagios_command { 'check_nrpe_cpu':
    command_line => "${nrpe} -c check_cpu",
  }
  nagios_command { 'check_nrpe_couchbase':
    command_line => "${nrpe} -c check_couchbase",
  }
  nagios_command { 'check_nrpe_couchbase_bucket':
    command_line => "${nrpe} -c check_couchbase_bucket",
  }
  nagios_command { 'check_nrpe_moxi':
    command_line => "${nrpe} -c check_moxi",
  }
  nagios_command { 'check_nrpe_memcached':
    command_line => "${nrpe} -c check_memcached",
  }
  nagios_command { 'check_nrpe_conntrack':
    command_line => "${nrpe} -c check_conntrack",
  }
  # Custom NRPE-based commands using custom plugins, conditionally enabled
  nagios_command { 'check_nrpe_megaraid_sas':
    command_line => "${nrpe} -c check_megaraid_sas",
  }
  nagios_command { 'check_nrpe_mptsas':
    command_line => "${nrpe} -c check_mptsas",
  }
  nagios_command { 'check_nrpe_mysql_health_connection_time':
    command_line => "${nrpe} -c check_mysql_health_connection_time",
  }
  nagios_command { 'check_nrpe_mysql_health_uptime':
    command_line => "${nrpe} -c check_mysql_health_uptime",
  }
  nagios_command { 'check_nrpe_mysql_health_threads_connected':
    command_line => "${nrpe} -c check_mysql_health_threads_connected",
  }
  nagios_command { 'check_nrpe_mysql_health_threadcache_hitrate':
    command_line => "${nrpe} -c check_mysql_health_threadcache_hitrate",
  }
  nagios_command { 'check_nrpe_mysql_health_querycache_hitrate':
    command_line => "${nrpe} -c check_mysql_health_querycache_hitrate",
  }
  nagios_command { 'check_nrpe_mysql_health_querycache_lowmem_prunes':
    command_line => "${nrpe} -c check_mysql_health_querycache_lowmem_prunes",
  }
  nagios_command { 'check_nrpe_mysql_health_keycache_hitrate':
    command_line => "${nrpe} -c check_mysql_health_keycache_hitrate",
  }
  nagios_command { 'check_nrpe_mysql_health_bufferpool_hitrate':
    command_line => "${nrpe} -c check_mysql_health_bufferpool_hitrate",
  }
  nagios_command { 'check_nrpe_mysql_health_bufferpool_wait_free':
    command_line => "${nrpe} -c check_mysql_health_bufferpool_wait_free",
  }
  nagios_command { 'check_nrpe_mysql_health_log_waits':
    command_line => "${nrpe} -c check_mysql_health_log_waits",
  }
  nagios_command { 'check_nrpe_mysql_health_tablecache_hitrate':
    command_line => "${nrpe} -c check_mysql_health_tablecache_hitrate",
  }
  nagios_command { 'check_nrpe_mysql_health_table_lock_contention':
    command_line => "${nrpe} -c check_mysql_health_table_lock_contention",
  }
  nagios_command { 'check_nrpe_mysql_health_index_usage':
    command_line => "${nrpe} -c check_mysql_health_index_usage",
  }
  nagios_command { 'check_nrpe_mysql_health_tmp_disk_tables':
    command_line => "${nrpe} -c check_mysql_health_tmp_disk_tables",
  }
  nagios_command { 'check_nrpe_mysql_health_slow_queries':
    command_line => "${nrpe} -c check_mysql_health_slow_queries",
  }
  nagios_command { 'check_nrpe_mysql_health_slave_lag':
    command_line => "${nrpe} -c check_mysql_health_slave_lag",
  }
  nagios_command { 'check_nrpe_mysql_health_slave_io_running':
    command_line => "${nrpe} -c check_mysql_health_slave_io_running",
  }
  nagios_command { 'check_nrpe_mysql_health_slave_sql_running':
    command_line => "${nrpe} -c check_mysql_health_slave_sql_running",
  }
  nagios_command { 'check_nrpe_mysql_health_open_files':
    command_line => "${nrpe} -c check_mysql_health_open_files",
  }
  nagios_command { 'check_nrpe_postgres_archive_ready':
    command_line => "${nrpe} -c check_postgres_archive_ready",
  }
  nagios_command { 'check_nrpe_postgres_autovac_freeze':
    command_line => "${nrpe} -c check_postgres_autovac_freeze",
  }
  nagios_command { 'check_nrpe_postgres_backends':
    command_line => "${nrpe} -c check_postgres_backends",
  }
  nagios_command { 'check_nrpe_postgres_bloat':
    command_line => "${nrpe} -c check_postgres_bloat",
  }
  nagios_command { 'check_nrpe_postgres_checkpoint':
    command_line => "${nrpe} -c check_postgres_checkpoint",
  }
  nagios_command { 'check_nrpe_postgres_cluster_id':
    command_line => "${nrpe} -c check_postgres_cluster_id",
  }
  nagios_command { 'check_nrpe_postgres_commitratio':
    command_line => "${nrpe} -c check_postgres_commitratio",
  }
  nagios_command { 'check_nrpe_postgres_connection':
    command_line => "${nrpe} -c check_postgres_connection",
  }
  nagios_command { 'check_nrpe_postgres_database_size':
    command_line => "${nrpe} -c check_postgres_database_size",
  }
  nagios_command { 'check_nrpe_postgres_disabled_triggers':
    command_line => "${nrpe} -c check_postgres_disabled_triggers",
  }
  nagios_command { 'check_nrpe_postgres_disk_space':
    command_line => "${nrpe} -c check_postgres_disk_space",
  }
  nagios_command { 'check_nrpe_postgres_fsm_pages':
    command_line => "${nrpe} -c check_postgres_fsm_pages",
  }
  nagios_command { 'check_nrpe_postgres_fsm_relations':
    command_line => "${nrpe} -c check_postgres_fsm_relations",
  }
  nagios_command { 'check_nrpe_postgres_hitratio':
    command_line => "${nrpe} -c check_postgres_hitratio",
  }
  nagios_command { 'check_nrpe_postgres_hot_standby_delay':
    command_line => "${nrpe} -c check_postgres_hot_standby_delay",
  }
  nagios_command { 'check_nrpe_postgres_last_analyze':
    command_line => "${nrpe} -c check_postgres_last_analyze",
  }
  nagios_command { 'check_nrpe_postgres_last_vacuum':
    command_line => "${nrpe} -c check_postgres_last_vacuum",
  }
  nagios_command { 'check_nrpe_postgres_last_autoanalyze':
    command_line => "${nrpe} -c check_postgres_last_autoanalyze",
  }
  nagios_command { 'check_nrpe_postgres_last_autovacuum':
    command_line => "${nrpe} -c check_postgres_last_autovacuum",
  }
  nagios_command { 'check_nrpe_postgres_listener':
    command_line => "${nrpe} -c check_postgres_listener",
  }
  nagios_command { 'check_nrpe_postgres_locks':
    command_line => "${nrpe} -c check_postgres_locks",
  }
  nagios_command { 'check_nrpe_postgres_logfile':
    command_line => "${nrpe} -c check_postgres_logfile",
  }
  nagios_command { 'check_nrpe_postgres_new_version_bc':
    command_line => "${nrpe} -c check_postgres_new_version_bc",
  }
  nagios_command { 'check_nrpe_postgres_new_version_box':
    command_line => "${nrpe} -c check_postgres_new_version_box",
  }
  nagios_command { 'check_nrpe_postgres_new_version_cp':
    command_line => "${nrpe} -c check_postgres_new_version_cp",
  }
  nagios_command { 'check_nrpe_postgres_new_version_pg':
    command_line => "${nrpe} -c check_postgres_new_version_pg",
  }
  nagios_command { 'check_nrpe_postgres_new_version_tnm':
    command_line => "${nrpe} -c check_postgres_new_version_tnm",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_cl_active':
    command_line => "${nrpe} -c check_postgres_pgb_pool_cl_active",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_cl_waiting':
    command_line => "${nrpe} -c check_postgres_pgb_pool_cl_waiting",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_sv_active':
    command_line => "${nrpe} -c check_postgres_pgb_pool_sv_active",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_sv_idle':
    command_line => "${nrpe} -c check_postgres_pgb_pool_sv_idle",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_sv_used':
    command_line => "${nrpe} -c check_postgres_pgb_pool_sv_used",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_sv_tested':
    command_line => "${nrpe} -c check_postgres_pgb_pool_sv_tested",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_sv_login':
    command_line => "${nrpe} -c check_postgres_pgb_pool_sv_login",
  }
  nagios_command { 'check_nrpe_postgres_pgb_pool_maxwait':
    command_line => "${nrpe} -c check_postgres_pgb_pool_maxwait",
  }
  nagios_command { 'check_nrpe_postgres_pgbouncer_backends':
    command_line => "${nrpe} -c check_postgres_pgbouncer_backends",
  }
  nagios_command { 'check_nrpe_postgres_pgbouncer_checksum':
    command_line => "${nrpe} -c check_postgres_pgbouncer_checksum",
  }
  nagios_command { 'check_nrpe_postgres_pgagent_jobs':
    command_line => "${nrpe} -c check_postgres_pgagent_jobs",
  }
  nagios_command { 'check_nrpe_postgres_prepared_txns':
    command_line => "${nrpe} -c check_postgres_prepared_txns",
  }
  nagios_command { 'check_nrpe_postgres_query_time':
    command_line => "${nrpe} -c check_postgres_query_time",
  }
  nagios_command { 'check_nrpe_postgres_same_schema':
    command_line => "${nrpe} -c check_postgres_same_schema",
  }
  nagios_command { 'check_nrpe_postgres_sequence':
    command_line => "${nrpe} -c check_postgres_sequence",
  }
  nagios_command { 'check_nrpe_postgres_settings_checksum':
    command_line => "${nrpe} -c check_postgres_settings_checksum",
  }
  nagios_command { 'check_nrpe_postgres_slony_status':
    command_line => "${nrpe} -c check_postgres_slony_status",
  }
  nagios_command { 'check_nrpe_postgres_txn_idle':
    command_line => "${nrpe} -c check_postgres_txn_idle",
  }
  nagios_command { 'check_nrpe_postgres_txn_time':
    command_line => "${nrpe} -c check_postgres_txn_time",
  }
  nagios_command { 'check_nrpe_postgres_txn_wraparound':
    command_line => "${nrpe} -c check_postgres_txn_wraparound",
  }
  nagios_command { 'check_nrpe_postgres_version':
    command_line => "${nrpe} -c check_postgres_version",
  }
  nagios_command { 'check_nrpe_postgres_wal_files':
    command_line => "${nrpe} -c check_postgres_wal_files",
  }
  nagios_command { 'check_nrpe_zk_avg_latency':
    command_line => "${nrpe} -c check_zk_avg_latency",
  }
  nagios_command { 'check_nrpe_zk_max_latency':
    command_line => "${nrpe} -c check_zk_max_latency",
  }
  nagios_command { 'check_nrpe_zk_outstanding_requests':
    command_line => "${nrpe} -c check_zk_outstanding_requests",
  }
  nagios_command { 'check_nrpe_zk_open_file_descriptor_count':
    command_line => "${nrpe} -c check_zk_open_file_descriptor_count",
  }
  nagios_command { 'check_nrpe_zk_pending_syncs':
    command_line => "${nrpe} -c check_zk_pending_syncs",
  }
  nagios_command { 'check_nrpe_zk_synced_followers':
    command_line => "${nrpe} -c check_zk_synced_followers",
  }
  nagios_command { 'check_nrpe_mongodb_asserts':
    command_line => "${nrpe} -c check_mongodb_asserts",
  }
  nagios_command { 'check_nrpe_mongodb_chunks_balance':
    command_line => "${nrpe} -c check_mongodb_chunks_balance",
  }
  nagios_command { 'check_nrpe_mongodb_collection_indexes':
    command_line => "${nrpe} -c check_mongodb_collection_indexes",
  }
  nagios_command { 'check_nrpe_mongodb_collections':
    command_line => "${nrpe} -c check_mongodb_collections",
  }
  nagios_command { 'check_nrpe_mongodb_collection_size':
    command_line => "${nrpe} -c check_mongodb_collection_size",
  }
  nagios_command { 'check_nrpe_mongodb_collection_state':
    command_line => "${nrpe} -c check_mongodb_collection_state",
  }
  nagios_command { 'check_nrpe_mongodb_collection_storageSize':
    command_line => "${nrpe} -c check_mongodb_collection_storageSize",
  }
  nagios_command { 'check_nrpe_mongodb_connect':
    command_line => "${nrpe} -c check_mongodb_connect",
  }
  nagios_command { 'check_nrpe_mongodb_connections':
    command_line => "${nrpe} -c check_mongodb_connections",
  }
  nagios_command { 'check_nrpe_mongodb_connect_primary':
    command_line => "${nrpe} -c check_mongodb_connect_primary",
  }
  nagios_command { 'check_nrpe_mongodb_current_lock':
    command_line => "${nrpe} -c check_mongodb_current_lock",
  }
  nagios_command { 'check_nrpe_mongodb_database_indexes':
    command_line => "${nrpe} -c check_mongodb_database_indexes",
  }
  nagios_command { 'check_nrpe_mongodb_databases':
    command_line => "${nrpe} -c check_mongodb_databases",
  }
  nagios_command { 'check_nrpe_mongodb_database_size':
    command_line => "${nrpe} -c check_mongodb_database_size",
  }
  nagios_command { 'check_nrpe_mongodb_flushing':
    command_line => "${nrpe} -c check_mongodb_flushing",
  }
  nagios_command { 'check_nrpe_mongodb_index_miss_ratio':
    command_line => "${nrpe} -c check_mongodb_index_miss_ratio",
  }
  nagios_command { 'check_nrpe_mongodb_journal_commits_in_wl':
    command_line => "${nrpe} -c check_mongodb_journal_commits_in_wl",
  }
  nagios_command { 'check_nrpe_mongodb_journaled':
    command_line => "${nrpe} -c check_mongodb_journaled",
  }
  nagios_command { 'check_nrpe_mongodb_last_flush_time':
    command_line => "${nrpe} -c check_mongodb_last_flush_time",
  }
  nagios_command { 'check_nrpe_mongodb_lock':
    command_line => "${nrpe} -c check_mongodb_lock",
  }
  nagios_command { 'check_nrpe_mongodb_memory':
    command_line => "${nrpe} -c check_mongodb_memory",
  }
  nagios_command { 'check_nrpe_mongodb_memory_mapped':
    command_line => "${nrpe} -c check_mongodb_memory_mapped",
  }
  nagios_command { 'check_nrpe_mongodb_opcounters':
    command_line => "${nrpe} -c check_mongodb_opcounters",
  }
  nagios_command { 'check_nrpe_mongodb_oplog':
    command_line => "${nrpe} -c check_mongodb_oplog",
  }
  nagios_command { 'check_nrpe_mongodb_page_faults':
    command_line => "${nrpe} -c check_mongodb_page_faults",
  }
  nagios_command { 'check_nrpe_mongodb_queries_per_second':
    command_line => "${nrpe} -c check_mongodb_queries_per_second",
  }
  nagios_command { 'check_nrpe_mongodb_queues':
    command_line => "${nrpe} -c check_mongodb_queues",
  }
  nagios_command { 'check_nrpe_mongodb_replica_primary':
    command_line => "${nrpe} -c check_mongodb_replica_primary",
  }
  nagios_command { 'check_nrpe_mongodb_replication_lag':
    command_line => "${nrpe} -c check_mongodb_replication_lag",
  }
  nagios_command { 'check_nrpe_mongodb_replication_lag_percent':
    command_line => "${nrpe} -c check_mongodb_replication_lag_percent",
  }
  nagios_command { 'check_nrpe_mongodb_replset_quorum':
    command_line => "${nrpe} -c check_mongodb_replset_quorum",
  }
  nagios_command { 'check_nrpe_mongodb_replset_state':
    command_line => "${nrpe} -c check_mongodb_replset_state",
  }
  nagios_command { 'check_nrpe_mongodb_row_count':
    command_line => "${nrpe} -c check_mongodb_row_count",
  }
  nagios_command { 'check_nrpe_mongodb_write_data_files':
    command_line => "${nrpe} -c check_mongodb_write_data_files",
  }
  nagios_command { 'check_nrpe_rabbitmq_connection_count':
    command_line => "${nrpe} -c check_rabbitmq_connection_count",
  }
  nagios_command { 'check_nrpe_rabbitmq_queues_count':
    command_line => "${nrpe} -c check_rabbitmq_queues_count",
  }
  nagios_command { 'check_nrpe_rabbitmq_mem_usage':
    command_line => "${nrpe} -c check_rabbitmq_mem_usage",
  }
  nagios_command { 'check_nrpe_rabbitmq_aliveness':
    command_line => "${nrpe} -c check_rabbitmq_aliveness",
  }
  nagios_command { 'check_nrpe_rabbitmq_cluster_status':
    command_line => "${nrpe} -c check_rabbitmq_cluster_status",
  }
  nagios_command { 'check_nrpe_redis_blocked_clients':
    command_line => "${nrpe} -c check_redis_blocked_clients",
  }
  nagios_command { 'check_nrpe_redis_connected_slaves':
    command_line => "${nrpe} -c check_redis_connected_slaves",
  }
  nagios_command { 'check_nrpe_redis_connected_clients':
    command_line => "${nrpe} -c check_redis_connected_clients",
  }
  nagios_command { 'check_nrpe_redis_evicted_keys':
    command_line => "${nrpe} -c check_redis_evicted_keys",
  }
  nagios_command { 'check_nrpe_redis_hitrate':
    command_line => "${nrpe} -c check_redis_hitrate",
  }
  nagios_command { 'check_nrpe_redis_response_time':
    command_line => "${nrpe} -c check_redis_response_time",
  }
  nagios_command { 'check_nrpe_redis_rejected_connections':
    command_line => "${nrpe} -c check_redis_rejected_connections",
  }
  nagios_command { 'check_nrpe_redis_uptime_in_seconds':
    command_line => "${nrpe} -c check_redis_uptime_in_seconds",
  }
  nagios_command { 'check_sentinel_master_health':
    command_line => "${nrpe} -c check_sentinel_master_health",
  }
  nagios_command { 'check_nrpe_hpsa':
    command_line => "${nrpe} -c check_hpsa",
  }
  nagios_command { 'check_nrpe_mountpoints':
    command_line => "${nrpe} -c check_mountpoints",
  }
  nagios_command { 'check_nrpe_mdraid':
    command_line => "${nrpe} -c check_mdraid",
  }
  nagios_command { 'check_nrpe_mailq':
    command_line => "${nrpe} -c check_mailq",
  }
  nagios_command { 'check_nrpe_cpu_temp':
    command_line => "${nrpe} -c check_cpu_temp",
  }
  nagios_command { 'check_nrpe_ipa':
    command_line => "${nrpe} -c check_ipa",
  }
  nagios_command { 'check_nrpe_ipa_replication':
    command_line => "${nrpe} -c check_ipa_replication",
  }
  nagios_command { 'check_nrpe_krb5':
    command_line => "${nrpe} -c check_krb5",
  }
  nagios_command { 'check_nrpe_elasticsearch_cluster_status':
    command_line => "${nrpe} -c check_elasticsearch_cluster_status",
  }
  nagios_command { 'check_nrpe_elasticsearch_jvm_usage':
    command_line => "${nrpe} -c check_elasticsearch_jvm_usage",
  }
  nagios_command { 'check_nrpe_elasticsearch_nodes':
    command_line => "${nrpe} -c check_elasticsearch_nodes",
  }
  nagios_command { 'check_nrpe_elasticsearch_split_brain':
    command_line => "${nrpe} -c check_elasticsearch_split_brain",
  }
  nagios_command { 'check_nrpe_elasticsearch_unassigned_shards':
    command_line => "${nrpe} -c check_elasticsearch_unassigned_shards",
  }
  nagios_command { 'check_nrpe_ssd':
    command_line => "${nrpe} -c check_ssd",
  }
  nagios_command { 'check_nrpe_tls_files':
    command_line => "${nrpe} -c check_tls_files",
  }
  nagios_command { 'check_nrpe_kafka':
    command_line => "${nrpe} -c check_kafka",
  }
  nagios_command { 'check_nrpe_kafka_isr':
    command_line => "${nrpe} -c check_kafka_isr",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_future_parts':
    command_line => "${nrpe} -c check_clickhouse_replication_future_parts",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_inserts_in_queue':
    command_line => "${nrpe} -c check_clickhouse_replication_inserts_in_queue",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_is_readonly':
    command_line => "${nrpe} -c check_clickhouse_replication_is_readonly",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_is_session_expired':
    command_line => "${nrpe} -c check_clickhouse_replication_is_session_expired",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_log_delay':
    command_line => "${nrpe} -c check_clickhouse_replication_log_delay",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_parts_to_check':
    command_line => "${nrpe} -c check_clickhouse_replication_parts_to_check",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_queue_size':
    command_line => "${nrpe} -c check_clickhouse_replication_queue_size",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_total_replicas':
    command_line => "${nrpe} -c check_clickhouse_replication_total_replicas",
  }
  nagios_command { 'check_nrpe_clickhouse_replication_active_replicas':
    command_line => "${nrpe} -c check_clickhouse_replication_active_replicas",
  }
  nagios_command { 'check_nrpe_http_chproxy':
    command_line => "${nrpe} -c check_http_chproxy",
  }
  nagios_command { 'check_nrpe_haproxy_stats':
    command_line => "${nrpe} -c check_haproxy_stats",
  }
  nagios_command { 'check_nrpe_consul':
    command_line => "${nrpe} -c check_consul",
  }

  # Nagios timeperiods
  # Taken from timeperiods.cfg
  nagios_timeperiod { '24x7':
    alias     => '24 Hours A Day, 7 Days A Week',
    monday    => '00:00-24:00',
    tuesday   => '00:00-24:00',
    wednesday => '00:00-24:00',
    thursday  => '00:00-24:00',
    friday    => '00:00-24:00',
    saturday  => '00:00-24:00',
    sunday    => '00:00-24:00',
  }
  nagios_timeperiod { 'workhours':
    alias     => 'Normal Work Hours',
    monday    => $timeperiod_workhours,
    tuesday   => $timeperiod_workhours,
    wednesday => $timeperiod_workhours,
    thursday  => $timeperiod_workhours,
    friday    => $timeperiod_workhours,
  }
  nagios_timeperiod { 'none':
    alias => 'No Time Is A Good Time',
  }

  # Nagios templates for various objects
  # Taken as-is from objects/templates.cfg
  $template_generic_contact_defaults = {
    'service_notification_period'   => '24x7',
    'host_notification_period'      => '24x7',
    'service_notification_options'  => 'u,c,r,f,s',
    'host_notification_options'     => 'd,u,r,f,s',
    'service_notification_commands' => 'notify-service-by-email',
    'host_notification_commands'    => 'notify-host-by-email',
    'register'                      => '0',
  }
  create_resources (nagios_contact, { 'generic-contact' => $template_generic_contact }, $template_generic_contact_defaults)
  $template_generic_host_defaults = {
    'notifications_enabled'        => '1',
    'event_handler_enabled'        => '1',
    'flap_detection_enabled'       => '1',
    'process_perf_data'            => '1',
    'retain_status_information'    => '1',
    'retain_nonstatus_information' => '1',
    'notification_period'          => '24x7',
    'register'                     => '0',
  }
  create_resources (nagios_host, { 'generic-host' => $template_generic_host }, $template_generic_host_defaults)
  $template_linux_server_defaults = {
    'use'                   => 'generic-host',
    'check_period'          => '24x7',
    'check_interval'        => '5',
    'retry_interval'        => '1',
    'max_check_attempts'    => '10',
    'check_command'         => 'check-host-alive',
    'notification_period'   => '24x7',
    'notification_interval' => '120',
    'notification_options'  => 'd,u,r',
    'contact_groups'        => 'admins',
    'register'              => '0',
  }
  create_resources (nagios_host, { 'linux-server' => $template_linux_server }, $template_linux_server_defaults)
  $template_windows_server_defaults = {
    'use'                   => 'generic-host',
    'check_period'          => '24x7',
    'check_interval'        => '5',
    'retry_interval'        => '1',
    'max_check_attempts'    => '10',
    'check_command'         => 'check-host-alive',
    'notification_period'   => '24x7',
    'notification_interval' => '30',
    'notification_options'  => 'd,r',
    'contact_groups'        => 'admins',
    'hostgroups'            => 'windows-servers',
    'register'              => '0',
  }
  create_resources (nagios_host, { 'windows-server' => $template_windows_server }, $template_windows_server_defaults)
  $template_generic_printer_defaults = {
    'use'                   => 'generic-host',
    'check_period'          => '24x7',
    'check_interval'        => '5',
    'retry_interval'        => '1',
    'max_check_attempts'    => '10',
    'check_command'         => 'check-host-alive',
    'notification_period'   => 'workhours',
    'notification_interval' => '30',
    'notification_options'  => 'd,r',
    'contact_groups'        => 'admins',
    'register'              => '0',
  }
  create_resources (nagios_host, { 'generic-printer' => $template_generic_printer }, $template_generic_printer_defaults)
  $template_generic_switch_defaults = {
    'use'                   => 'generic-host',
    'check_period'          => '24x7',
    'check_interval'        => '5',
    'retry_interval'        => '1',
    'max_check_attempts'    => '10',
    'check_command'         => 'check-host-alive',
    'notification_period'   => '24x7',
    'notification_interval' => '30',
    'notification_options'  => 'd,r',
    'contact_groups'        => 'admins',
    'register'              => '0',
  }
  create_resources (nagios_host, { 'generic-switch' => $template_generic_switch }, $template_generic_switch_defaults)
  $template_generic_service_defaults = {
    'active_checks_enabled'        => '1',
    'passive_checks_enabled'       => '1',
    'parallelize_check'            => '1',
    'obsess_over_service'          => '1',
    'check_freshness'              => '0',
    'notifications_enabled'        => '1',
    'event_handler_enabled'        => '1',
    'flap_detection_enabled'       => '1',
    'process_perf_data'            => '1',
    'retain_status_information'    => '1',
    'retain_nonstatus_information' => '1',
    'is_volatile'                  => '0',
    'check_period'                 => '24x7',
    'max_check_attempts'           => '3',
    'check_interval'               => '10',
    'retry_check_interval'         => '2',
    'contact_groups'               => 'admins',
    'notification_options'         => 'w,u,c,r',
    'notification_interval'        => '60',
    'notification_period'          => '24x7',
    'register'                     => '0',
  }
  create_resources (nagios_service, { 'generic-service' => $template_generic_service }, $template_generic_service_defaults)
  $template_local_service_defaults = {
    'use'                   => 'generic-service',
    'max_check_attempts'    => '4',
    'check_interval'        => '5',
    'retry_check_interval'  => '1',
    'register'              => '0',
  }
  create_resources (nagios_service, { 'local-service' => $template_local_service }, $template_local_service_defaults)

  # Additional useful resources
  nagios_servicegroup { 'elasticsearch':
    alias => 'ElasticSearch service checks',
  }
  nagios_servicegroup { 'mysql_health':
    alias => 'MySQL Health service checks',
  }
  nagios_servicegroup { 'postgres':
    alias => 'PostgreSQL service checks',
  }
  nagios_servicegroup { 'mongodb':
    alias => 'MongoDB service checks',
  }
  nagios_servicegroup { 'rabbitmq':
    alias => 'RabbitMQ service checks',
  }
  nagios_servicegroup { 'redis':
    alias => 'Redis service checks',
  }
  nagios_servicegroup { 'zookeeper':
    alias => 'Zookeeper service checks',
  }
  nagios_servicegroup { 'clickhouse':
    alias => 'ClickHouse service checks',
  }

}
