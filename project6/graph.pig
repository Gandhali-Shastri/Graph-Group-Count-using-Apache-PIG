IG = LOAD '$G' USING PigStorage(',') AS (key, val);
GRP = GROUP IG by key;
N   = FOREACH GRP GENERATE group, COUNT(IG);
C = GROUP N by $1;
S = FOREACH C GENERATE group, COUNT(N);
DUMP S;
STORE S INTO '$O' USING PigStorage (',');