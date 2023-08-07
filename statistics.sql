-- stats for table jidelni_listek
exec dbms_stats.gather_table_stats(USER, 'JIDELNI_LISTEK', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'JIDELNI_LISTEK';

-- stats for table stoly
exec dbms_stats.gather_table_stats(USER, 'STOLY', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'STOLY';

-- stats for table objednavka
exec dbms_stats.gather_table_stats(USER, 'OBJEDNAVKA', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'OBJEDNAVKA';

-- stats for table objednavka_jidel
exec dbms_stats.gather_table_stats(USER, 'OBJEDNAVKA_JIDEL', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'OBJEDNAVKA_JIDEL';

-- stats for table oddeleni
exec dbms_stats.gather_table_stats(USER, 'ODDELENI', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'ODDELENI';

-- stats for table pozice
exec dbms_stats.gather_table_stats(USER, 'POZICE', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'POZICE';

-- stats for table zamestnanci
exec dbms_stats.gather_table_stats(USER, 'ZAMESTNANCI', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'ZAMESTNANCI';

-- stats for table denni_trzby
exec dbms_stats.gather_table_stats(USER, 'DENNI_TRZBY', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'DENNI_TRZBY';

-- stats for table plat_zamestnancu
exec dbms_stats.gather_table_stats(USER, 'PLAT_ZAMESTNANCU', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'PLAT_ZAMESTNANCU';

-- stats for table dodavatel
exec dbms_stats.gather_table_stats(USER, 'DODAVATEL', cascade => TRUE);

select column_name, nullable, num_distinct, num_nulls, density, histogram
from ALL_TAB_COLUMNS
where table_name = 'DODAVATEL';