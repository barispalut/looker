view: deneme1{
  # No primary key is defined for this view. In order to join this view in an Explore,
  derived_table: {
    sql:
    select distinct
    h.user_id,
    h.Install_Date,
    h.event_time,
    h.event_name,
    h.current_loading_time,
    s.Level_Start_Time,
    e1.Level_End_Time,
    s.Next_Level_Start_Time,
    h.collection_id,
    h.level_id,
    h.level_retry_count,
    e1.win,
    e1.play_time,
    e1.retry_count_lifetime,
    e1.Retry_Count,
    e1.Last_to_First,
    e2.b1_used,
    e2.b2_used,
    e2.b3_used,
    e2.pb1_used,
    e2.pb2_used,
    e2.pb3_used,
    e2.plus5_used,
    e2.rem_move_count,
    e2.remaining_coin,
    e2.remaining_lives,
    e2.start_move_count,
    e3.b1_inventory,
    e3.b2_inventory,
    e3.b3_inventory,
    e3.pb1_inventory,
    e3.pb2_inventory,
    e3.pb3_inventory,
    e3.remaining_star,
    ce.coin_earn_amount,
    ce.coin_earn_info,
    cs.coin_spent_amount,
    cs.coin_spent_info,
    h.test_55_variant,
    h.test_58_variant,
    h.test_60_variant,
    h.test_56_variant,
    h.test_57_variant,
    h.test_61_variant,
    h.test_62_variant,
    h.test_63_variant,
    h.platform,
    h.app_version,
    h.country
    from
    (
    --All Events
        select distinct
        user_id as user_id,
        TIMESTAMP_MICROS(event_timestamp) as event_time,
        min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'current_loading_time') as numeric) as current_loading_time,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
        event_name,
        platform,
        app_info.version as app_version,
        geo.country as country,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_55')) as integer) as test_55_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_58')) as integer) as test_58_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_60')) as integer) as test_60_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_56')) as integer) as test_56_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_57')) as integer) as test_57_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_61')) as integer) as test_61_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_62')) as integer) as test_62_variant,
        cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_63')) as integer) as test_63_variant,
        from
        (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
        where 1=1
        and event_name not in ("Level_End_P1","Level_End_P2","Level_End_P3","network_request", "Stage_End_Event_1")
    ) h
    left join
    (
     --Level_Start_P1
     select distinct user_id, install_date, Level_Start_Time,
     case when lead(Level_Start_Time)  over (partition by user_id order by Level_Start_Time asc) is not null then lead(Level_Start_Time) over (partition by user_id  order by Level_Start_Time asc) else current_timestamp end as Next_Level_Start_Time,
      collection_id,  level_id, platform, version, country
     from
     (
        select
        distinct
        user_id as user_id,
        TIMESTAMP_MICROS(event_timestamp) as Level_Start_Time,
        TIMESTAMP_MICROS (user_first_touch_timestamp) as install_date,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
        platform,
        app_info.version as version,
        geo.country as country
        from
       (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
        where 1=1
        and event_name in ("Level_Start_P1")
    )
    --order by 1,3
    ) s
    on s.user_id = h.user_id
    and s.version = h.app_version
    and s.Level_Start_Time = h.event_time
    left join
    (
        --Level_End_P1
        select distinct
        user_id as user_id,
        TIMESTAMP_MICROS(event_timestamp) as Level_End_Time,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) as win,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'play_time') as numeric) as play_time,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_lifetime') as integer) as retry_count_lifetime,
        (row_number() over (partition by user_id, cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer),cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer),app_info.version
        order by TIMESTAMP_MICROS(event_timestamp))) -1 as Retry_Count,
        row_number() over (partition by user_id, cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer),cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer),app_info.version
        order by TIMESTAMP_MICROS(event_timestamp) desc) as Last_to_First,
        platform,
        app_info.version,
        geo.country
        from
        (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
        where 1=1
        and event_name in ("Level_End_P1")
    ) e1
    on s.user_id = e1.user_id
    and s.level_id = e1.level_id
    and s.collection_id = e1.collection_id
    and s.version = e1.version
    and s.Level_Start_Time < e1.Level_End_Time
    and s.Next_Level_Start_Time > e1.Level_End_Time
    left join
    (
        --Level_End_P2
        select distinct
        user_id as user_id,
        TIMESTAMP_MICROS(event_timestamp) as Level_End_Time_P2,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) as win,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b1_used') as integer) as b1_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b2_used') as integer) as b2_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b3_used') as integer) as b3_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_used') as integer) as pb1_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_used') as integer) as pb2_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_used') as integer) as pb3_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'plus5_used') as integer) as plus5_used,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'rem_move_count') as integer) as rem_move_count,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as remaining_coin,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_lives') as integer) as remaining_lives,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_lifetime') as integer) as retry_count_lifetime_P2,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'start_move_count') as integer) as start_move_count,
        platform,
        app_info.version,
        geo.country
        from
        (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
        where 1=1
        and event_name in ("Level_End_P2")
    ) e2
    on s.user_id = e2.user_id
    and s.level_id = e2.level_id
    and s.collection_id = e2.collection_id
    and s.version = e2.version
    and s.Level_Start_Time < e2.Level_End_Time_P2
    and s.Next_Level_Start_Time > e2.Level_End_Time_P2
    left join
    (
        --Level_End_P3
        select distinct
        user_id as user_id,
        TIMESTAMP_MICROS(event_timestamp) as Level_End_Time_P3,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) as win,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b1_inventory') as integer) as b1_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b2_inventory') as integer) as b2_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b3_inventory') as integer) as b3_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_inventory') as integer) as pb1_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_inventory') as integer) as pb2_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_inventory') as integer) as pb3_inventory,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as remaining_coin_P3,
        cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as remaining_star,
        platform,
        app_info.version,
        geo.country
        from
        (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
        where 1=1
        and event_name in ("Level_End_P3")

      ) e3
      on s.user_id = e3.user_id
      and s.level_id = e3.level_id
      and s.collection_id = e3.collection_id
      and s.version = e3.version
      and s.Level_Start_Time < e3.Level_End_Time_P3
      and s.Next_Level_Start_Time > e3.Level_End_Time_P3
      left join
      (
      --Coin Earn
      select distinct
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'amount') as integer) as coin_earn_amount,
      (SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'info') as coin_earn_info

      from
      (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
      where 1=1
      and event_name in ('coin_earn')
      ) ce
      on ce.user_id=h.user_id
      and ce.event_time = h.event_time
      left join
      (
      --Coin Spent
      select distinct
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'amount') as integer) as coin_spent_amount,
      (SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'info') as coin_spent_info

      from
      (select * from `big-blast.analytics_270556009.events_*` where  {%condition event_time%}  TIMESTAMP_MICROS(event_timestamp) {%endcondition%})
      where 1=1
      and event_name in ('coin_spend')
      ) cs
      on cs.user_id = h.user_id
      and cs.event_time = h.event_time






      ;;

  }

  filter: event_time {
    type: date_time
    sql: {%condition%} ${TABLE}.event_time {%endcondition%}  ;;

  }


  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      ;;
  }

  dimension_group: Install_Date {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.Install_Date
      ;;
  }

  dimension_group: event_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time
      ;;
  }

  dimension: event_name {
    type: string
    sql:  ${TABLE}.event_name ;;
  }


  dimension: current_loading_time {
    type: number
    sql:  ${TABLE}.current_loading_time ;;
  }



  dimension_group: Level_Start_Time  {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.Level_Start_Time ;;
  }


  dimension_group: Level_End_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.Level_End_Time;;
  }

  dimension_group: Next_Level_Start_Time  {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.Next_Level_Start_Time ;;
  }

  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
  }


  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
  }

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: play_time {
    type: number
    sql:  ${TABLE}.play_time ;;
  }


  dimension: retry_count_lifetime {
    type: number
    sql:  ${TABLE}.retry_count_lifetime ;;
  }


  dimension:  b1_used {
    type: number
    sql:  ${TABLE}.b1_used ;;
  }


  dimension:  b2_used {
    type: number
    sql:  ${TABLE}.b2_used ;;
  }


  dimension:  b3_used {
    type: number
    sql:  ${TABLE}.b3_used ;;
  }


  dimension:  pb1_used {
    type: number
    sql:  ${TABLE}.pb1_used ;;
  }


  dimension:  pb2_used {
    type: number
    sql:  ${TABLE}.pb2_used ;;
  }


  dimension:  pb3_used {
    type: number
    sql:  ${TABLE}.pb3_used ;;
  }


  dimension:    plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }


  dimension:  rem_move_count {
    type: number
    sql:  ${TABLE}.rem_move_count ;;
  }


  dimension:  remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }


  dimension:  remaining_lives {
    type: number
    sql:  ${TABLE}.remaining_lives ;;
  }



  dimension: start_move_count {
    type: number
    sql:  ${TABLE}.start_move_count ;;
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

  dimension:  pb1_inventory {
    type: number
    sql:  ${TABLE}.pb1_inventory ;;
  }


  dimension:  pb2_inventory {
    type: number
    sql:  ${TABLE}.pb2_inventory ;;
  }

  dimension: pb3_inventory {
    type: number
    sql:  ${TABLE}.pb3_inventory ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }




  dimension: test_55_variant {
    type: number
    sql:  ${TABLE}.test_55_variant ;;
  }



  dimension: test_58_variant {
    type: number
    sql:  ${TABLE}.test_58_variant ;;
  }


  dimension: test_60_variant {
    type: number
    sql:  ${TABLE}.test_60_variant ;;
  }


  dimension: test_56_variant {
    type: number
    sql:  ${TABLE}.test_56_variant ;;
  }


  dimension: test_57_variant {
    type: number
    sql:  ${TABLE}.test_57_variant ;;
  }



  dimension: test_61_variant {
    type: number
    sql:  ${TABLE}.test_61_variant ;;
  }



  dimension: test_62_variant {
    type: number
    sql:  ${TABLE}.test_62_variant ;;
  }


  dimension: test_63_variant {
    type: number
    sql:  ${TABLE}.test_63_variant ;;
  }




  dimension:  platform {
    type: string
    sql:  ${TABLE}.platform ;;
  }


  dimension: app_version {
    type: string
    sql:  ${TABLE}.app_version ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }

  dimension: Retry_Count {
    type: number
    sql: ${TABLE}.Retry_Count ;;

  }

  dimension: Last_to_First {
    type: number
    sql: ${TABLE}.Last_to_First ;;

  }


  dimension: Move_Spent{
    type: number
    sql: ${TABLE}.start_move_count - ${TABLE}.rem_move_count ;;

  }

  dimension: Churn{
    type: string
    sql:  case when date_diff (${TABLE}.Next_Level_Start_Time, ${TABLE}.Level_Start_Time, hour) >= 72 then "C" else null end  ;;

  }

  dimension: Period_Day{
    type: number
    sql: date_diff(${TABLE}.event_time , ${TABLE}.Install_Date, day) ;;

  }

  dimension: Time_Since_Install{
    type: number
    sql: date_diff(current_timestamp(), ${TABLE}.Install_Date, day) ;;

  }


  dimension: Coin_Earn_Amount {
    type: number
    sql:  ${TABLE}.coin_earn_amount ;;
  }



  dimension: Coin_Earn_Info {
    type: string
    sql:  ${TABLE}.coin_earn_info ;;
  }

  dimension: Coin_Spent_Amount {
    type: number
    sql:  ${TABLE}.coin_spent_amount ;;
  }

  dimension: Coin_Spent_Info {
    type: string
    sql:  ${TABLE}.coin_spent_info ;;
  }










  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: deneme1 {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
