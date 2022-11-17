view: earn_reward {
  derived_table: {
    sql:
--earn_reward
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'reward') as reward,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'value') as integer) as value,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'info') as info,
FROM `big-blast.analytics_270556009.events_*`
where event_name = 'earn_reward';;

  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
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
    primary_key: yes
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }

  dimension: reward {
    type: string
    sql:  ${TABLE}.reward ;;
  }

  dimension: value {
    type: number
    sql:  ${TABLE}.value ;;
  }

  dimension: info {
    type: string
    sql:  ${TABLE}.info ;;
  }






}
