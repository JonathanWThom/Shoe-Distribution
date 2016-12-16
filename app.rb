require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

post('/stores') do
  @store = Store.create(:name => params['store_name'])
  redirect('/stores/'.concat(@store.id().to_s()))
end

get('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  erb(:store)
end

patch('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  @store.update(:name => params['new_name'])
  erb(:store)
end
