view: Retention {
  derived_table: {
    sql:
    select distinct period_day as Day, sum(install_user_count) as User_Count, sum(user_count) as Retained_User_Count, (sum(user_count)/sum(install_user_count)) as Retention_Rate from
    (
            select distinct install_tarihi, period_day, install_user_count ,user_count, Retention_Rate from
            (
                    select distinct install_tarihi, period_day, install_user_count ,user_count, safe_divide(user_count,install_user_count ) as Retention_Rate, date_diff(current_date(), install_tarihi, day) as date_dif  from
                    (
                            select distinct install_tarihi, period_day, count(distinct user_id) over (partition by install_tarihi, period_day) as user_count,count(distinct user_id) over (partition by install_tarihi) as install_user_count  from
                            (
                                    select distinct user_id , date(install_date) as install_tarihi, event_time, cast(date_diff(event_time , install_date, day) as integer) as period_day, cast(date_diff(current_timestamp(),install_date,day) as integer) as time_since_install from
                                    (
                                            select distinct user_id, install_date, event_time   from
                                            (
                                                    SELECT
                                                    user_id as user_id,
                                                    cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_55')) as integer) as test_55_variant,
                                                    cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_58')) as integer) as test_58_variant,
                                                    cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_60')) as integer) as test_60_variant,
                                                    cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_56')) as integer) as test_56_variant,
                                                    cast ((SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_57')) as integer) as test_57_variant,
                                                    TIMESTAMP_MICROS(event_timestamp) as event_time, min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
                                                    min(safe_cast(app_info.version as integer)) over (partition by user_id) as app_version, geo.country as country
                                                    FROM `big-blast.analytics_270556009.events_*`
                                                    where 1=1
                                                    and platform='IOS'
                                            )
                                            where 1=1
                                            and {%condition install_date%} install_date {%endcondition%}
                                            and {%condition test_55_variant%} test_55_variant {%endcondition%}
                                            and {%condition test_58_variant%} test_58_variant {%endcondition%}
                                            and {%condition test_60_variant%} test_60_variant {%endcondition%}
                                            and {%condition test_56_variant%} test_56_variant {%endcondition%}
                                            and {%condition test_57_variant%} test_57_variant {%endcondition%}
                                            and {%condition app_version%} app_version {%endcondition%}
                                            and {%condition country%} country {%endcondition%}

      )

      )

      )

      )
      where date_dif > period_day
      --order by 1,2
      )
      group by 1
      order by 1




      ;;

  }

  filter: install_date {
    type: date_time


  }


  filter: test_55_variant {
    type: number


  }


  filter: test_58_variant {
    type: number


  }
  filter: test_60_variant {
    type: number


  }


  filter: test_56_variant {
    type: number


  }

  filter: test_57_variant {
    type: number


  }

  filter: app_version {
    type: number


  }

  filter: country {
    type: string


  }

  dimension: Day {
    type: number

  }



  dimension: User_Count {
    type: number

  }




  dimension: Retained_User_Count {
    type: number

  }


  dimension: Retention_Rate {
    type: number

  }



}

# view: retention {
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
