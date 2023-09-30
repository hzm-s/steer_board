import { Application } from "@hotwired/stimulus"

import Reveal from "stimulus-reveal-controller"
import { Dropdown } from "tailwindcss-stimulus-components"

const application = Application.start()

application.register('reveal', Reveal)
application.register('dropdown', Dropdown)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
