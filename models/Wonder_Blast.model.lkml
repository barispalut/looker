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
  sql_on: ${level_start_p1.Event_Time_time} = ${event_info.Event_Time_time}
      and ${event_info.user_id}=${level_start_p1.user_id}
      and ${level_start_p1.collection_id} = ${event_info.collection_id}
      and ${event_info.level_id} = ${level_start_p1.level_id}
      and ${event_info.level_retry_count} = ${level_start_p1.level_retry_count}

      ;;
  relationship: one_to_one

}

}
