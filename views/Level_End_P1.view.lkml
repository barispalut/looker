view: level_end_p1 {
  derived_table: {
    sql:
--Level_End_P1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
timestamp_millis(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'first_install_epoch') as integer)) as first_install_epoch,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) as win,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_session') as integer) as  retry_count_session,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'play_time') as numeric) as  play_time,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'in_air_merge') as integer) as in_air_merge,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'charger_fill') as numeric) as charger_fill,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_created') as integer) as ultiA_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_created') as integer) as ultiB_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_created') as integer) as ultiC_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_bycharger') as integer) as ultiA_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_bycharger') as integer) as ultiB_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_bycharger') as integer) as ultiC_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_remaining') as integer) as ultiA_remaining,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_remaining') as integer) as ultiB_remaining,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_remaining') as integer) as ultiC_remaining,
cast(app_info.version as integer) as app_version
FROM `big-blast.analytics_270556009.events_*`
where 1=1
and event_name='Level_End_P1' ;;

  }










}
