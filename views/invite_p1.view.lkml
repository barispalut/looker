view: invite_p1 {
  derived_table: {
    sql:
--invite_p1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'invite_type') as invite_type,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'invite_used') as integer) as invite_used,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'time_utc') as time_utc,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'offer_ignore') as integer) as offer_ignore,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'offer_share') as integer) as offer_share,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'moves_ignore') as integer) as moves_ignore,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'moves_share') as integer) as moves_share,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'refill_ignore') as integer) as refill_ignore,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'refill_share') as integer) as refill_share,
FROM `big-blast.analytics_270556009.events_*`
where event_name = 'invite_p1';;

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

  dimension: invite_type {
    type: string
    sql:  ${TABLE}.invite_type ;;
  }

  dimension: invite_used {
    type: number
    sql:  ${TABLE}.invite_used ;;
  }

  dimension: offer_ignore {
    type: number
    sql:  ${TABLE}.offer_ignore ;;
  }

  dimension: offer_share {
    type: number
    sql:  ${TABLE}.offer_share ;;
  }

  dimension: moves_ignore {
    type: number
    sql:  ${TABLE}.moves_ignore ;;
  }

  dimension: moves_share {
    type: number
    sql:  ${TABLE}.moves_share ;;
  }

  dimension: refill_ignore {
    type: number
    sql:  ${TABLE}.refill_ignore;;
  }

  dimension: refill_share {
    type: number
    sql:  ${TABLE}.refill_share;;
  }



}
