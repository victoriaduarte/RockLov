require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log") # arquivo salva o log

class MongoDB
  attr_accessor :client, :users, :equipos # coleções "client", "users" e "equipos" são propriedades/atributos da classe "MongoDB"

  def initialize # construtor
    @client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def drop_danger
    client.database.drop
  end

  def insert_users(docs)
    @users.insert_many(docs) # insere todos os users no before do spec_helper
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
