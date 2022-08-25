# Define the database connection to be used for this model.
connection: "looker_first"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: looker_first_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_first_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Looker First"

explore: events_20220726 {
  join: events_20220726__items {
    view_label: "Events 20220726: Items"
    sql: LEFT JOIN UNNEST(${events_20220726.items}) as events_20220726__items ;;
    relationship: one_to_many
  }

  join: events_20220726__event_params {
    view_label: "Events 20220726: Event Params"
    sql: LEFT JOIN UNNEST(${events_20220726.event_params}) as events_20220726__event_params ;;
    relationship: one_to_many
  }

  join: events_20220726__user_properties {
    view_label: "Events 20220726: User Properties"
    sql: LEFT JOIN UNNEST(${events_20220726.user_properties}) as events_20220726__user_properties ;;
    relationship: one_to_many
  }
}

explore: deneme1 {}
