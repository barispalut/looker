view: iap_p1 {
  derived_table: {
    sql:
--iap_p1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'iap_preset') as integer) as iap_preset,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'inapp_item_id') as inapp_item_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'inapp_item_name') as inapp_item_name,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'inapp_item_price') as numeric) as inapp_item_price,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_life') as integer) as remaining_life,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as remaining_coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as remaining_star,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb1_inventory') as integer) as eb1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb2_inventory') as integer) as eb2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'eb3_inventory') as integer) as eb3_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_inventory') as integer) as pb1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_inventory') as integer) as pb2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_inventory') as integer) as pb3_inventory,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'iap_list') as iap_list,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'total_iap_count') as integer) as total_iap_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'total_rev_user') as numeric) as total_rev_user,
FROM `big-blast.analytics_270556009.events_*`
where event_name='iap_p1';;

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

  dimension: iap_preset {
    type: number
    sql:  ${TABLE}.iap_preset ;;
  }

  dimension: inapp_item_id {
    type: string
    sql:  ${TABLE}.inapp_item_id ;;
  }

  dimension: inapp_item_name {
    type: string
    sql:  ${TABLE}.inapp_item_name ;;
  }

  dimension: inapp_item_price {
    type: number
    sql:  ${TABLE}.inapp_item_price ;;
  }

  dimension: remaining_life {
    type: number
    sql:  ${TABLE}.remaining_life ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: eb1_inventory {
    type: number
    sql:  ${TABLE}.eb1_inventory ;;
  }

  dimension: eb2_inventory {
    type: number
    sql:  ${TABLE}.eb2_inventory ;;
  }

  dimension: eb3_inventory {
    type: number
    sql:  ${TABLE}.eb3_inventory ;;
  }

  dimension: pb1_inventory {
    type: number
    sql:  ${TABLE}.pb1_inventory ;;
  }

  dimension: pb2_inventory {
    type: number
    sql:  ${TABLE}.pb2_inventory ;;
  }

  dimension: pb3_inventory {
    type: number
    sql:  ${TABLE}.pb3_inventory ;;
  }

  dimension: iap_list {
    type: string
    sql:  ${TABLE}.iap_list ;;
  }

  dimension: total_iap_count {
    type: number
    sql:  ${TABLE}.total_iap_count ;;
  }

  dimension: total_rev_user {
    type: number
    sql:  ${TABLE}.total_rev_user ;;
  }


















}
