require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/stores') do
  @store = Store.new(:name => params['store_name'])
  if @store.save()
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:errors)
  end
end

get('/stores/:id') do
  @brands = Brand.all()
  @store = Store.find(params['id'].to_i)
  erb(:store)
end

post('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  brand_ids = params['brand_ids']
  brand_ids.each() do |brand_id|
    brand = Brand.find(brand_id)
    @store.brands.push(brand)
  end
  redirect('/stores/'.concat(@store.id().to_s()))
end

patch('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  @store.update(:name => params['new_name'])
  erb(:store)
end

delete('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  @store.destroy()
  redirect('/')
end

post('/brands') do
  @brand = Brand.new(:name => params['brand_name'])
  if @brand.save()
    redirect('/brands/'.concat(@brand.id().to_s()))
  else
    erb(:errors)
  end
end

get('/brands/:id') do
  @brand = Brand.find(params['id'].to_i)
  erb(:brand)
end
