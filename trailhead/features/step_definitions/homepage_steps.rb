Then(/^I have home page$/) do
  _home_page = $web_app.testini(TestScreen)
  _home_page.check_all_ui
  _home_page.check_cards_order("Trails")
  _home_page.check_cards_order("Modules")
  _home_page.check_cards_order("Projects")
end