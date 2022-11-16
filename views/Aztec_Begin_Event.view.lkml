view: aztec_begin_event {
  derived_table: {
    sql:
--Aztec_Begin_Event
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
timestamp_millis(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'launch_time_stamp') as integer)) as launch_time_stamp,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb1_inventory') as integer) as eb1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb2_inventory') as integer) as eb2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb3_inventory') as integer) as eb3_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_inventory') as integer) as pb1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_inventory') as integer) as pb2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_inventory') as integer) as pb3_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'coin') as integer) as coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'lives') as integer) as lives,
FROM `big-blast.analytics_270556009.events_*`
where event_name='Aztec_Begin_Event';;

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

  dimension_group: aztec_launch_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.launch_time_stamp ;;
  }

  dimension: eb1_inventory {
    type: number
    sql:  ${TABLE}.eb1_inventory;;
  }

  dimension: eb2_inventory {
    type: number
    sql:  ${TABLE}.eb2_inventory;;
  }

  dimension: eb3_inventory {
    type: number
    sql:  ${TABLE}.eb3_inventory;;
  }

  dimension: pb1_inventory {
    type: number
    sql:  ${TABLE}.pb1_inventory;;
  }

  dimension: pb2_inventory {
    type: number
    sql:  ${TABLE}.pb2_inventory;;
  }

  dimension: pb3_inventory {
    type: number
    sql:  ${TABLE}.pb3_inventory;;
  }

  dimension: coin {
    type: number
    sql:  ${TABLE}.coin;;
  }

  dimension: lives {
    type: number
    sql:  ${TABLE}.lives;;
  }




}
