view: level_all {
  sql_table_name: `big-blast.analytics_270556009.Level_All_view` ;;

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
    hidden: yes
  }

  dimension: install_date {
    type: string
    sql: ${TABLE}.install_date ;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time ;;
  }

  dimension_group: End_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.end_time ;;
  }

  dimension: level_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.level_key ;;
    hidden: yes
  }

  dimension: level_key_2 {
    type: string
    primary_key: yes
    sql:  ${TABLE}.level_key_2 ;;
    hidden: yes
  }

  dimension: event_key {
    type: string
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }


  dimension: episode_id {
    type: number
    sql:  ${TABLE}.episode_id ;;
  }

  dimension: level_progress {
    type: number
    sql:  ${TABLE}.level_progress ;;

  }

  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;

  }

  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;

  }

  dimension: try {
    type: number
    sql:  ${TABLE}.try ;;

  }

  dimension: session_id {
    type: number
    sql:  ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: iap_count_lifetime {
    type: number
    sql:  ${TABLE}.iap_count_lifetime ;;

  }
  dimension: sum_iap_lifetime {
    type: number
    sql:  ${TABLE}.sum_iap_lifetime ;;

  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: retry_count_session {
    type: number
    sql:  ${TABLE}.retry_count_session ;;
  }

  dimension: retry_count_lifetime {
    type: number
    sql:  ${TABLE}.retry_count_lifetime ;;
  }

  dimension: streak_stage {
    type: number
    sql:  ${TABLE}.streak ;;
  }

  dimension: b1_inventory {
    type: number
    sql:  ${TABLE}.b1_inventory ;;
  }


  dimension: b2_inventory {
    type: number
    sql:  ${TABLE}.b2_inventory ;;
  }


  dimension: b3_inventory {
    type: number
    sql:  ${TABLE}.b3_inventory ;;
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

  dimension: age_stage {
    type: number
    sql:  ${TABLE}.age_stage ;;
  }

  dimension: win_streak {
    type: number
    sql:  ${TABLE}.win_streak ;;
  }

  dimension: pb1_timed {
    type: number
    sql:  ${TABLE}.pb1_timed ;;
  }


  dimension: pb2_timed {
    type: number
    sql:  ${TABLE}.pb2_timed ;;
  }


  dimension: pb3_timed {
    type: number
    sql:  ${TABLE}.pb3_timed ;;
  }

  dimension: pb1_used {
    type: number
    sql:  ${TABLE}.pb1_used ;;
  }


  dimension: pb2_used {
    type: number
    sql:  ${TABLE}.pb2_used ;;
  }


  dimension: pb3_used {
    type: number
    sql:  ${TABLE}.pb3_used ;;
  }

  dimension: life_timed {
    type: number
    sql:  ${TABLE}.life_timed ;;
  }

  dimension: remaining_lives {
    type: number
    sql:  ${TABLE}.remaining_lives ;;
  }

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: play_time {
    type: number
    sql:  ${TABLE}.play_time ;;
  }

  dimension: charger_fill {
    type: number
    sql:  ${TABLE}.charger_fill ;;
  }

  dimension: ultiA_created {
    type: number
    sql:  ${TABLE}.ultiA_created ;;
  }

  dimension: ultiB_created {
    type: number
    sql:  ${TABLE}.ultiB_created ;;
  }

  dimension: ultiC_created {
    type: number
    sql:  ${TABLE}.ultiC_created ;;
  }

  dimension: ultiA_bycharger {
    type: number
    sql:  ${TABLE}.ultiA_bycharger ;;
  }

  dimension: ultiB_bycharger {
    type: number
    sql:  ${TABLE}.ultiB_bycharger ;;
  }

  dimension: ultiC_bycharger {
    type: number
    sql:  ${TABLE}.ultiC_bycharger ;;
  }

  dimension: ultiA_remaining {
    type: number
    sql:  ${TABLE}.ultiA_remaining ;;
  }

  dimension: ultiB_remaining {
    type: number
    sql:  ${TABLE}.ultiB_remaining ;;
  }

  dimension: ultiC_remaining {
    type: number
    sql:  ${TABLE}.ultiC_remaining ;;
  }

  dimension: stage_id {
    type: number
    sql:  ${TABLE}.stage_id ;;
  }

  dimension: stage_count {
    type: number
    sql:  ${TABLE}.stage_count ;;
  }


  dimension: end_remaining_coin {
    type: number
    sql:  ${TABLE}.end_remaining_coin ;;
  }

  dimension: end_remaining_lives {
    type: number
    sql:  ${TABLE}.end_remaining_lives ;;
  }


  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  dimension: b1_used {
    type: number
    sql:  ${TABLE}.eb1_used ;;
  }

  dimension: b2_used {
    type: number
    sql:  ${TABLE}.eb2_used ;;
  }

  dimension: b3_used {
    type: number
    sql:  ${TABLE}.eb3_used ;;
  }

  dimension: start_move_count {
    type: number
    sql:  ${TABLE}.start_move_count ;;
  }

  dimension: rem_move_count {
    type: number
    sql:  ${TABLE}.rem_move_count ;;
  }

  dimension: move_spent {
    type: number
    sql:  ${TABLE}.move_spent ;;
  }

  dimension: end_remaining_star {
    type: number
    sql:  ${TABLE}.end_remaining_star ;;
  }

  dimension: end_b1_inventory {
    type: number
    sql:  ${TABLE}.end_b1_inventory ;;
  }


  dimension: end_b2_inventory {
    type: number
    sql:  ${TABLE}.end_b2_inventory ;;
  }


  dimension: end_b3_inventory {
    type: number
    sql:  ${TABLE}.end_b3_inventory ;;
  }

  dimension: end_pb1_inventory {
    type: number
    sql:  ${TABLE}.end_pb1_inventory ;;
  }


  dimension: end_pb2_inventory {
    type: number
    sql:  ${TABLE}.end_pb2_inventory ;;
  }


  dimension: end_pb3_inventory {
    type: number
    sql:  ${TABLE}.end_pb3_inventory ;;
  }


  dimension: initial_board_hp {
    type: number
    sql:  ${TABLE}.initial_board_hp ;;
  }

  dimension: final_board_hp {
    type: number
    sql:  ${TABLE}.final_board_hp ;;
  }

  dimension: zero_damage_percentage {
    type: number
    sql:  ${TABLE}.zero_damage_percentage ;;
  }

  dimension: shuffle_count {
    type: number
    sql:  ${TABLE}.shuffle_count ;;
  }

  dimension: disco_merges {
    type: number
    sql:  ${TABLE}.disco_merges ;;
  }

  dimension: ultiA_exploded {
    type: number
    sql:  ${TABLE}.ultiA_exploded ;;
  }

  dimension: ultiB_exploded {
    type: number
    sql:  ${TABLE}.ultiB_exploded ;;
  }

  dimension: ultiC_exploded {
    type: number
    sql:  ${TABLE}.ultiC_exploded ;;
  }


  dimension: first_UltiA_move {
    type: number
    sql:  ${TABLE}.first_UltiA_move ;;
  }



  dimension: first_UltiB_move {
    type: number
    sql:  ${TABLE}.first_UltiB_move ;;
  }


  dimension: first_UltiC_move {
    type: number
    sql:  ${TABLE}.first_UltiC_move ;;
  }


  dimension: level_quit {
    type: number
    sql:  ${TABLE}.level_quit ;;
  }

  dimension: app_verison {
    type: number
    sql:  ${TABLE}.app_version ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }

  dimension: Level_Churn{
    type: string
    sql:  case when date_diff (${TABLE}.next_event_time, ${TABLE}.event_time, hour) >= 72 then "C" else null end  ;;

  }


  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }

  dimension: bpm {
    type: number
    sql:  ${TABLE}.bpm ;;
  }

  dimension: try_progress_without_ma {
    type: number
    sql:  ${TABLE}.try_progress_without_ma ;;
  }

}
