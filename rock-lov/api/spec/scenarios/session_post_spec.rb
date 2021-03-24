describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do # ":all" o hook roda apenas um vez antes antes dos testes
      payload = { email: "betao@hotmail.com", password: "pwd123" }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24 # tamanho padrão do id no mongodb
    end
  end

  # examples = [
  #   {
  #     title: "senha incorreta",
  #     payload: { email: "victoria@hotmail.com", password: "123456" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "usuario nao existe",
  #     payload: { email: "404@hotmail.com", password: "123456" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "email em branco",
  #     payload: { email: "", password: "123456" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "sem o campo email",
  #     payload: { password: "123456" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "senha em branco",
  #     payload: { email: "victoria@hotmail.com", password: "" },
  #     code: 412,
  #     error: "required password",
  #   },
  #   {
  #     title: "sem o campo senha",
  #     payload: { email: "victoria@hotmail.com" },
  #     code: 412,
  #     error: "required password",
  #   },
  # ]

  examples = Helpers::get_fixture("login")

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuario" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
