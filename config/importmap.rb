# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "font-awesome", to: "https://kit.fontawesome.com/21f6899a03.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "sortablejs" # @1.15.0
