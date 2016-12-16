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
  if brand_ids
    brand_ids.each() do |brand_id|
      brand = Brand.find(brand_id)
      @store.brands.push(brand)
    end
  end
  redirect('/stores/'.concat(@store.id().to_s()))
end

patch('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  if params['new_name']
    @store.update(:name => params['new_name'])
  end
  redirect('/stores/'.concat(@store.id().to_s()))
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
  @stores = Store.all()
  @brand = Brand.find(params['id'].to_i)
  erb(:brand)
end

post('/brands/:id') do
  @brand = Brand.find(params['id'].to_i)
  store_ids = params['store_ids']
  link = params['link']
  if store_ids
    store_ids.each() do |store_id|
      store = Store.find(store_id)
      @brand.stores.push(store)
    end
  end
  if link != ''
    @brand.links.create(:link => link)
  end
  redirect('/brands/'.concat(@brand.id().to_s()))
end

patch('/brands/:id') do
  @brand = Brand.find(params['id'].to_i)
  if params['brand_name']
    @brand.update(:name => params['brand_name'])
  end
  redirect('/brands/'.concat(@brand.id().to_s()))
end

delete('/brands/:id') do
  @brand = Brand.find(params['id'].to_i)
  @brand.destroy()
  redirect('/')
end
