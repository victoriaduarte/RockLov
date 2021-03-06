Before do # executa esse código antes de cada cenário
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  #page.driver.browser.manage.window.maximize  # maximiza a janela
  page.current_window.resize_to(1440, 900) # tamanho padrão da janela (valor mínimo)
end
