require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log") # arquivo salva o log

class MongoDB
  attr_accessor :users, :equipos # agora as coleções "users" e "equipos" são propriedades da classe "MongoDB"

  def initialize # construtor
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    # Deleta o email no db automaticamente antes de preencher o cadastro, assim, o teste sempre passará
    @users.delete_many({ email: email }) # deleta todos os registros com uma determinada condição (email)
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, user_id)
    obj_id = BSON::ObjectId.from_string(user_id)
    @equipos.delete_many({ name: name, user: obj_id })
  end

  def get_mongo_id
    return BSON::ObjectId.new
  end
end
