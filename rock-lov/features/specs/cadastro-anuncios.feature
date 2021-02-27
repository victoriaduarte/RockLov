#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizá-los para locação
    @cadastro_anuncio
    Cenario: Novo equipo

        Dado que estou logado como "victoria@hotmail.com" e "pwd123"
            E que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard 