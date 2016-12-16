# _Shoe Distribution_

#### _Web application that allows user to create a network of shoe stores and the brands they carry. 12.16.16_

#### By _**Jonathan Thom**_

## Description

_Users can input new stores, new brands, and assign brands to stores (and vice versa). There is also functionality for updating and deleting brands and stores. Makes use of ActiveRecord and a many-to-many database schema._

## Setup/Installation Requirements

* _In the command line, run:_
```
postgres
```
* _Then, in another window:_
```
git clone https://github.com/JonathanWThom/Shoe-Distribution
cd Shoe-Distribution
bundle
rake db:create
bundle exec rake db:migrate
rake db:test:prepare
ruby app.rb
```
* _Then, in any modern browser, navigate to:_

```
localhost:4567
````

## Specifications
1. User can add and view a shoe store page, name will be titleized.
  * Input example: "payless"
  * Output: "Payless"

2. User can change a shoe store name
  * Input example: (On Payles page) "costco"; Click("Change Name")
  * Output: "Costco"

3. User can add and view a shoe brand page, name will be titleized.
  * Input example: "nike"
  * Output: "Nike"

4. User can change a shoe brand name
  * Input example: (On Nike Page) "adidas"; Click("Change Name")
  * Output: "Adidas"

5. User can add a shoe brand to a store
  * Input example: Check("Adidas"); Click("Add Brand")
  * Output: "Current Brands Available: Adidas."

6. User can add a store to a brand
  * Input example: Check("Costco"); Click("Add Brand")
  * Output: "Can be found at these stores: Costco"

7. User can delete a store
  * Input example: "Costco"; Click("Delete Store")
  * Output: (Return to Homepage, Costco not listed)

8. User can delete a brand
  * Input example: "Nike"; Click("Delete Brand")
  * Output: (Return to Homepage, Nike not listed)

9. Each brand can be featured in multiple stores, each store can carry multiple brands.

## Support and contact details

_Contact Jonathan at: jonathan.thom1990@gmail.com_

## Technologies Used

_Ruby, Sinatra, ActiveRecord, HTML, Bootstrap_

### License

*MIT*

Copyright (c) 2016 **_Jonathan Thom_**
