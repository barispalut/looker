view: invite_p1 {
  sql_table_name: `big-blast.analytics_270556009.invite_p1_view` ;;

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

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
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
