

class LoginPage
    include Capybara::DSL # a classe LoginPage precisa conhecer todos os recursos do Capybara
    
    def open
        visit "/"
    end

    def login(email, password) # agrupa os métodos dos elementos em uma funcionalidade
        find("input[placeholder='Seu email']").set email
        find("input[type=password]").set password   
        click_button "Entrar"
    end
end