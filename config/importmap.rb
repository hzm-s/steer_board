# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "font-awesome", to: "https://kit.fontawesome.com/21f6899a03.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "sortablejs" # @1.15.0
pin "tailwindcss-stimulus-components" # @4.0.4
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "stimulus-reveal-controller" # @4.1.0
