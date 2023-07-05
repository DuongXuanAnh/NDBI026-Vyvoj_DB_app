-- stats for table jidelni_listek
exec dbms_stats.gather_table_stats(USER, 'jidelni_listek', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'JIDELNI_LISTEK';

-- stats for table stoly
exec dbms_stats.gather_table_stats(USER, 'stoly', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'STOLY';

-- stats for table objednavka
exec dbms_stats.gather_table_stats(USER, 'objednavka', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'OBJEDNAVKA';

-- stats for table objednavka_jidel
exec dbms_stats.gather_table_stats(USER, 'objednavka_jidel', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'OBJEDNAVKA_JIDEL';

-- stats for table pozice
exec dbms_stats.gather_table_stats(USER, 'pozice', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'POZICE';

-- stats for table zamestnanci
exec dbms_stats.gather_table_stats(USER, 'zamestnanci', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'ZAMESTNANCI';

-- stats for table denni_trzby
exec dbms_stats.gather_table_stats(USER, 'denni_trzby', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'DENNI_TRZBY';

-- stats for table plat_zamestnancu
exec dbms_stats.gather_table_stats(USER, 'plat_zamestnancu', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'PLAT_ZAMESTNANCU';

-- stats for table dodavatel
exec dbms_stats.gather_table_stats(USER, 'dodavatel', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'DODAVATEL';