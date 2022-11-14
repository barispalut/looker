view: kart_race_p1 {
  derived_table: {
    sql:
--kart_race_p1
SELECT distinct
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'race_id') as race_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'player_rank') as integer) as player_rank,
timestamp_seconds(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'race_start_time') as integer)) as race_start_time,
timestamp_seconds(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'player_finish_time') as integer)) as player_finish_time,
timestamp_seconds(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'tournament_end_time') as integer)) as tournament_end_time,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'progress_level') as integer) as progress_level,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1') as integer) as pb1,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_timed') as integer) as pb1_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2') as integer) as pb2,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_timed') as integer) as pb2_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3') as integer) as pb3,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_timed') as integer) as pb3_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb1') as integer) as eb1,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb1_timed') as integer) as eb1_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb2') as integer) as eb2,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb2_timed') as integer) as eb2_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb3') as integer) as eb3,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb3_timed') as integer) as eb3_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'lives_timed') as integer) as lives_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'coin') as integer) as coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'icon_seen_count') as integer) as icon_seen_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_seen_count') as integer) as level_seen_count,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'entry_type') as entry_type,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'event_type') as event_type,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'other_user_0') as integer) as other_user_0,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'other_user_1') as integer) as other_user_1,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'other_user_2') as integer) as other_user_2,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'other_user_3') as integer) as other_user_3,
FROM `big-blast.analytics_270556009.events_*`
where event_name='kart_race_p1';;

  }


  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      ;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time ;;
    hidden: yes
  }

  dimension: session_id {
    type: number
    sql:  ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
    hidden: yes
  }

  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
    hidden: yes
  }

  dimension: level_retry_count {
    type: number
    sql:  ${TABLE}.level_retry_count ;;
    hidden: yes
  }

  dimension: time_key {
    type: string
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }

  dimension: race_id {
    type: string
    sql:  ${TABLE}.race_id ;;
  }

  dimension: player_rank {
    type: number
    sql:  ${TABLE}.player_rank ;;
  }

  dimension_group: race_start_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.race_start_time ;;
  }

  dimension_group: player_finish_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.player_finish_time ;;
  }

  dimension_group: tournament_end_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.tournament_end_time ;;
  }

  dimension: progress_level {
    type: number
    sql:  ${TABLE}.progress_level ;;
  }

  dimension: pb1 {
    type: number
    sql:  ${TABLE}.pb1;;
  }

  dimension: pb1_timed {
    type: number
    sql:  ${TABLE}.pb1_timed;;
  }

  dimension: pb2 {
    type: number
    sql:  ${TABLE}.pb2;;
  }

  dimension: pb2_timed {
    type: number
    sql:  ${TABLE}.pb2_timed;;
  }

  dimension: pb3 {
    type: number
    sql:  ${TABLE}.pb3;;
  }

  dimension: pb3_timed {
    type: number
    sql:  ${TABLE}.pb3_timed;;
  }

  dimension: eb1 {
    type: number
    sql:  ${TABLE}.eb1;;
  }

  dimension: eb1_timed {
    type: number
    sql:  ${TABLE}.eb1_timed;;
  }

  dimension: eb2 {
    type: number
    sql:  ${TABLE}.eb2;;
  }

  dimension: eb2_timed {
    type: number
    sql:  ${TABLE}.eb2_timed;;
  }

  dimension: eb3 {
    type: number
    sql:  ${TABLE}.eb3;;
  }

  dimension: eb3_timed {
    type: number
    sql:  ${TABLE}.eb3_timed;;
  }

  dimension: lives_timed {
    type: number
    sql:  ${TABLE}.lives_timed;;
  }

  dimension: coin {
    type: number
    sql:  ${TABLE}.coin;;
  }

  dimension: icon_seen_count {
    type: number
    sql:  ${TABLE}.icon_seen_count;;
  }

  dimension: level_seen_count {
    type: number
    sql:  ${TABLE}.level_seen_count;;
  }

  dimension: entry_type {
    type: string
    sql:  ${TABLE}.entry_type;;
  }

  dimension: event_type {
    type: string
    sql:  ${TABLE}.event_type;;
  }

  dimension: other_user_0 {
    type: number
    sql:  ${TABLE}.other_user_0;;
  }

  dimension: other_user_1 {
    type: number
    sql:  ${TABLE}.other_user_1;;
  }

  dimension: other_user_2 {
    type: number
    sql:  ${TABLE}.other_user_2;;
  }

  dimension: other_user_3 {
    type: number
    sql:  ${TABLE}.other_user_3;;
  }


}
