view: test_properties {
  derived_table: {
    sql:
    --Event_Info
    SELECT
    user_id as user_id,
    TIMESTAMP_MICROS(event_timestamp) as event_time,
    cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
    event_name,
    63 as test_name,
    cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_63') as integer) as variant,
    FROM `big-blast.analytics_270556009.events_*`
    where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_63') as integer) is not null

    union distinct

    SELECT
    user_id as user_id,
    TIMESTAMP_MICROS(event_timestamp) as event_time,
    cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
    event_name,
    64 as test_name,
    cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_64') as integer) as variant,
    FROM `big-blast.analytics_270556009.events_*`
    where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_64') as integer) is not null

    union distinct

    SELECT
    user_id as user_id,
    TIMESTAMP_MICROS(event_timestamp) as event_time,
    cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
    event_name,
    65 as test_name,
    cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_65') as integer) as variant,
    FROM `big-blast.analytics_270556009.events_*`
    where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_65') as integer) is not null
    ;;
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

  dimension: time_key {
    type: string
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }


  dimension: test_name {
    type: number
    sql:  ${TABLE}.test_name ;;
  }

  dimension: variant {
    type: number
    sql:  ${TABLE}.variant ;;
  }





}
