[![Gem Version](https://fury-badge.herokuapp.com/rb/datatable_state.png)](http://badge.fury.io/rb/datatable_state)

# DatatableState

## Installation

Add this line to your application's Gemfile:

    gem 'datatable_state'

Then execute:

    bundle

Copy migrations and run them:

    rake datatable_state:install:migrations
    rake db:migrate

Add routes:

    # config/routes.rb
    mount DatatableState::Engine => "/datatable_states"

Add helpers:

    # app/controllers/application_controller.rb
    helper DatatableState::ApplicationHelper

Javascripts:

    //app/assets/javascripts/application.js
    //= require datatable_state/store

Insert callbacks and utilites into DataTables definition:

    {
      ...
      "pageLength": datatableStateDefaultPageLength(),
      "stateLoadCallback": datatableStateLoad,
      "stateSaveCallback": datatableStateSave,
      "stateSaveParams": datatableStateSkipPerColumn,
      ...
    }

Use `saved_display_length` helper with server-side datatable
    <table class="datatable datatable_ajax" ... <%= saved_display_length %>>
