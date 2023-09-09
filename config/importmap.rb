# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "font-awesome", to: "https://kit.fontawesome.com/21f6899a03.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-dropdown" # @2.1.0
pin "hotkeys-js" # @3.12.0
pin "stimulus-use" # @0.51.3
pin "stimulus-reveal-controller" # @4.1.0
