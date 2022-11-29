view: iap_p1 {
  sql_table_name: `big-blast.analytics_270556009.iap_p1_view`  ;;

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

  dimension: try_count {
    type: number
    sql:  ${TABLE}.try_count ;;
    hidden: yes
  }

  dimension: event_key{
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key;;
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
