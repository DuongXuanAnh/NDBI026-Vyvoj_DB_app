-- delete of all stats

exec dbms_stats.delete_table_stats(USER, 'jidelni_listek');

exec dbms_stats.delete_table_stats(USER, 'stoly');

exec dbms_stats.delete_table_stats(USER, 'objednavka');

exec dbms_stats.delete_table_stats(USER, 'pozice');

exec dbms_stats.delete_table_stats(USER, 'denni_trzby');

exec dbms_stats.delete_table_stats(USER, 'plat_zamestnancu');

exec dbms_stats.delete_table_stats(USER, 'dodavatel');