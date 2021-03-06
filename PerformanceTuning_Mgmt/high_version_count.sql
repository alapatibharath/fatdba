@plusenv
set lines 180

select sql_id,sc.address,version_count,parsing_schema_name,reason,lpad(' ',180,'-')||replace(sql_text,(13)) sql_text from (
select
 sql_id, address, '** reason => '
||decode(max(UNBOUND_CURSOR),'Y','UNBOUND_CURSOR '||': '||count(*)||' |  ')
||decode(max(SQL_TYPE_MISMATCH),'Y','SQL_TYPE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(OPTIMIZER_MISMATCH),'Y','OPTIMIZER_MISMATCH '||': '||count(*)||' |  ')
||decode(max(OUTLINE_MISMATCH),'Y','OUTLINE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(STATS_ROW_MISMATCH),'Y','STATS_ROW_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LITERAL_MISMATCH),'Y','LITERAL_MISMATCH '||': '||count(*)||' |  ')
||decode(max(FORCE_HARD_PARSE),'Y','FORCE_HARD_PARSE '||': '||count(*)||' |  ')
||decode(max(EXPLAIN_PLAN_CURSOR),'Y','EXPLAIN_PLAN_CURSOR '||': '||count(*)||' |  ')
||decode(max(BUFFERED_DML_MISMATCH),'Y','BUFFERED_DML_MISMATCH '||': '||count(*)||' |  ')
||decode(max(PDML_ENV_MISMATCH),'Y','PDML_ENV_MISMATCH '||': '||count(*)||' |  ')
||decode(max(INST_DRTLD_MISMATCH),'Y','INST_DRTLD_MISMATCH '||': '||count(*)||' |  ')
||decode(max(SLAVE_QC_MISMATCH),'Y','SLAVE_QC_MISMATCH '||': '||count(*)||' |  ')
||decode(max(TYPECHECK_MISMATCH),'Y','TYPECHECK_MISMATCH '||': '||count(*)||' |  ')
||decode(max(AUTH_CHECK_MISMATCH),'Y','AUTH_CHECK_MISMATCH '||': '||count(*)||' |  ')
||decode(max(BIND_MISMATCH),'Y','BIND_MISMATCH '||': '||count(*)||' |  ')
||decode(max(DESCRIBE_MISMATCH),'Y','DESCRIBE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LANGUAGE_MISMATCH),'Y','LANGUAGE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(TRANSLATION_MISMATCH),'Y','TRANSLATION_MISMATCH '||': '||count(*)||' |  ')
||decode(max(BIND_EQUIV_FAILURE),'Y','BIND_EQUIV_FAILURE '||': '||count(*)||' |  ')
||decode(max(INSUFF_PRIVS),'Y','INSUFF_PRIVS '||': '||count(*)||' |  ')
||decode(max(INSUFF_PRIVS_REM),'Y','INSUFF_PRIVS_REM '||': '||count(*)||' |  ')
||decode(max(REMOTE_TRANS_MISMATCH),'Y','REMOTE_TRANS_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LOGMINER_SESSION_MISMATCH),'Y','LOGMINER_SESSION_MISMATCH '||': '||count(*)||' |  ')
||decode(max(INCOMP_LTRL_MISMATCH),'Y','INCOMP_LTRL_MISMATCH '||': '||count(*)||' |  ')
||decode(max(OVERLAP_TIME_MISMATCH),'Y','OVERLAP_TIME_MISMATCH '||': '||count(*)||' |  ')
||decode(max(EDITION_MISMATCH),'Y','EDITION_MISMATCH '||': '||count(*)||' |  ')
||decode(max(MV_QUERY_GEN_MISMATCH),'Y','MV_QUERY_GEN_MISMATCH '||': '||count(*)||' |  ')
||decode(max(USER_BIND_PEEK_MISMATCH),'Y','USER_BIND_PEEK_MISMATCH '||': '||count(*)||' |  ')
||decode(max(TYPCHK_DEP_MISMATCH),'Y','TYPCHK_DEP_MISMATCH '||': '||count(*)||' |  ')
||decode(max(NO_TRIGGER_MISMATCH),'Y','NO_TRIGGER_MISMATCH '||': '||count(*)||' |  ')
||decode(max(FLASHBACK_CURSOR),'Y','FLASHBACK_CURSOR '||': '||count(*)||' |  ')
||decode(max(ANYDATA_TRANSFORMATION),'Y','ANYDATA_TRANSFORMATION '||': '||count(*)||' |  ')
||decode(max(PDDL_ENV_MISMATCH),'Y','PDDL_ENV_MISMATCH '||': '||count(*)||' |  ')
||decode(max(TOP_LEVEL_RPI_CURSOR),'Y','TOP_LEVEL_RPI_CURSOR '||': '||count(*)||' |  ')
||decode(max(DIFFERENT_LONG_LENGTH),'Y','DIFFERENT_LONG_LENGTH '||': '||count(*)||' |  ')
||decode(max(LOGICAL_STANDBY_APPLY),'Y','LOGICAL_STANDBY_APPLY '||': '||count(*)||' |  ')
||decode(max(DIFF_CALL_DURN),'Y','DIFF_CALL_DURN '||': '||count(*)||' |  ')
||decode(max(BIND_UACS_DIFF),'Y','BIND_UACS_DIFF '||': '||count(*)||' |  ')
||decode(max(PLSQL_CMP_SWITCHS_DIFF),'Y','PLSQL_CMP_SWITCHS_DIFF '||': '||count(*)||' |  ')
||decode(max(CURSOR_PARTS_MISMATCH),'Y','CURSOR_PARTS_MISMATCH '||': '||count(*)||' |  ')
||decode(max(STB_OBJECT_MISMATCH),'Y','STB_OBJECT_MISMATCH '||': '||count(*)||' |  ')
||decode(max(CROSSEDITION_TRIGGER_MISMATCH),'Y','CROSSEDITION_TRIGGER_MISMATCH '||': '||count(*)||' |  ')
||decode(max(PQ_SLAVE_MISMATCH),'Y','PQ_SLAVE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(TOP_LEVEL_DDL_MISMATCH),'Y','TOP_LEVEL_DDL_MISMATCH '||': '||count(*)||' |  ')
||decode(max(MULTI_PX_MISMATCH),'Y','MULTI_PX_MISMATCH '||': '||count(*)||' |  ')
||decode(max(BIND_PEEKED_PQ_MISMATCH),'Y','BIND_PEEKED_PQ_MISMATCH '||': '||count(*)||' |  ')
||decode(max(MV_REWRITE_MISMATCH),'Y','MV_REWRITE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(ROLL_INVALID_MISMATCH),'Y','ROLL_INVALID_MISMATCH '||': '||count(*)||' |  ')
||decode(max(OPTIMIZER_MODE_MISMATCH),'Y','OPTIMIZER_MODE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(PX_MISMATCH),'Y','PX_MISMATCH '||': '||count(*)||' |  ')
||decode(max(MV_STALEOBJ_MISMATCH),'Y','MV_STALEOBJ_MISMATCH '||': '||count(*)||' |  ')
||decode(max(FLASHBACK_TABLE_MISMATCH),'Y','FLASHBACK_TABLE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LITREP_COMP_MISMATCH),'Y','LITREP_COMP_MISMATCH '||': '||count(*)||' |  ')
||decode(max(PLSQL_DEBUG),'Y','PLSQL_DEBUG '||': '||count(*)||' |  ')
||decode(max(LOAD_OPTIMIZER_STATS),'Y','LOAD_OPTIMIZER_STATS '||': '||count(*)||' |  ')
||decode(max(ACL_MISMATCH),'Y','ACL_MISMATCH '||': '||count(*)||' |  ')
||decode(max(FLASHBACK_ARCHIVE_MISMATCH),'Y','FLASHBACK_ARCHIVE_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LOCK_USER_SCHEMA_FAILED),'Y','LOCK_USER_SCHEMA_FAILED '||': '||count(*)||' |  ')
||decode(max(REMOTE_MAPPING_MISMATCH),'Y','REMOTE_MAPPING_MISMATCH '||': '||count(*)||' |  ')
||decode(max(LOAD_RUNTIME_HEAP_FAILED),'Y','LOAD_RUNTIME_HEAP_FAILED '||': '||count(*)||' |  ')
||decode(max(HASH_MATCH_FAILED),'Y','HASH_MATCH_FAILED '||': '||count(*)||' |  ')
||decode(max(PURGED_CURSOR),'Y','PURGED_CURSOR '||': '||count(*)||' |  ')
||decode(max(BIND_LENGTH_UPGRADEABLE),'Y','BIND_LENGTH_UPGRADEABLE '||': '||count(*)||' |  ')
||decode(max(USE_FEEDBACK_STATS),'Y','USE_FEEDBACK_STATS '||': '||count(*)||' |  ')
 reason
from
   v$sql_shared_cursor
group by
   sql_id, address
) sc join v$sqlarea sq using(sql_id) 
where version_count	> 10
and parsing_schema_name not in ('SYS')
order by sql_id, version_count 
;
