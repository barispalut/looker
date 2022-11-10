connection: "looker_first"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: event_info {

join:level_start_p1  {
  type: left_outer
  sql_on: ${event_info.time_key} = ${level_start_p1.time_key}
      and ${event_info.user_id}=${level_start_p1.user_id} ;;
  relationship: one_to_one
}

join:level_end_p1  {
  type: left_outer
  sql_on: ${event_info.time_key} = ${level_end_p1.time_key}
      and ${event_info.user_id} = ${level_end_p1.user_id};;
  relationship: one_to_one
}

join:level_end_p2  {
    type: left_outer
    sql_on: ${event_info.time_key} = ${level_end_p2.time_key}
      and ${event_info.user_id} = ${level_end_p2.user_id};;
    relationship: one_to_one
  }

join:level_end_p3  {
    type: left_outer
    sql_on: ${event_info.time_key} = ${level_end_p3.time_key}
      and ${event_info.user_id} = ${level_end_p3.user_id};;
    relationship: one_to_one
  }

join:level_end_p4  {
    type: left_outer
    sql_on: ${event_info.time_key} = ${level_end_p4.time_key}
      and ${event_info.user_id} = ${level_end_p4.user_id};;
    relationship: one_to_one
  }

join:stage_end_event_1 {
    type: left_outer
    sql_on: ${event_info.time_key} = ${stage_end_event_1.time_key}
      and ${event_info.user_id} = ${stage_end_event_1.user_id};;
    relationship: one_to_one
  }

  join:building_p1 {
    type: left_outer
    sql_on: ${event_info.time_key} = ${building_p1.time_key}
      and ${event_info.user_id} = ${building_p1.user_id};;
    relationship: one_to_one
  }

  join:iap_p1 {
    type: left_outer
    sql_on: ${event_info.time_key} = ${iap_p1.time_key}
      and ${event_info.user_id} = ${iap_p1.user_id};;
    relationship: one_to_one
  }

  join:coin_earn {
    type: left_outer
    sql_on: ${event_info.time_key} = ${coin_earn.time_key}
      and ${event_info.user_id} = ${coin_earn.user_id};;
    relationship: one_to_one
  }

  join:coin_spend {
    type: left_outer
    sql_on: ${event_info.time_key} = ${coin_spend.time_key}
      and ${event_info.user_id} = ${coin_spend.user_id};;
    relationship: one_to_one
  }

  join:wilsons_fair_homepage_stage_event {
    type: left_outer
    sql_on: ${event_info.time_key} = ${wilsons_fair_homepage_stage_event.time_key}
      and ${event_info.user_id} = ${wilsons_fair_homepage_stage_event.user_id};;
    relationship: one_to_one
  }

  join:kart_race_p1 {
    type: left_outer
    sql_on: ${event_info.time_key} = ${kart_race_p1.time_key}
      and ${event_info.user_id} = ${kart_race_p1.user_id};;
    relationship: one_to_one
  }

  join:earn_reward {
    type: left_outer
    sql_on: ${event_info.time_key} = ${earn_reward.time_key}
      and ${event_info.user_id} = ${earn_reward.user_id};;
    relationship: one_to_one
  }

  join:aztec_launch_event {
    type: left_outer
    sql_on: ${event_info.time_key} = ${aztec_launch_event.time_key}
      and ${event_info.user_id} = ${aztec_launch_event.user_id};;
    relationship: one_to_one
  }

  join:aztec_begin_event {
    type: left_outer
    sql_on: ${event_info.time_key} = ${aztec_begin_event.time_key}
      and ${event_info.user_id} = ${aztec_begin_event.user_id};;
    relationship: one_to_one
  }

join:test_properties  {
    type: left_outer
    sql_on: ${test_properties.user_id} = ${event_info.user_id}
      and ${test_properties.time_key} = ${event_info.time_key};;
    relationship: one_to_one
  }

}
