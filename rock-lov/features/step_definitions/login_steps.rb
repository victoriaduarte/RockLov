Dado('que acesso a página principal') do
    @login_page.open
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    @login_page.login(email, password)
end
  