# _Shoe Distribution_

#### _Web application that allows user to create a network of shoe stores and the brands they carry. 12.16.16_

#### By _**Jonathan Thom**_

## Description

_Users can input new stores, new brands, and assign brands to stores (and vice versa). There is also functionality for updating and deleting brands and stores, as well as adding images for brands. Makes use of ActiveRecord and a many-to-many database schema._

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
  * Input: "payless"
  * Output: "Payless"

2. User can change a shoe store name
  * Input: (On Payles page) "costco"; Click("Change Name")
  * Output: "Costco"

3. User can add and view a shoe brand page, name will be titleized.
  * Input: "nike"
  * Output: "Nike"

4. User can change a shoe brand name
  * Input: (On Nike Page) "adidas"; Click("Change Name")
  * Output: "Adidas"

5. User can add a shoe brand to a store
  * Input: Check("Adidas"); Click("Add Brand")
  * Output: "Current Brands Available: Adidas."

6. User can add a store to a brand
  * Input: Check("Costco"); Click("Add Brand")
  * Output: "Can be found at these stores: Costco"

7. User can add a link to an image for a brand
  * Input: "test-image.com/images/image.jpg"
  * Output: (Image shown on page)

8. User can click to see full sized image, then delete it.
  * Input: Click("Image"), Click("Delete Image")
  * Output: "There are no images yet"

9. User can delete a store
  * Input: "Costco"; Click("Delete Store")
  * Output: (Return to Homepage, Costco not listed)

10. User can delete a brand
  * Input: "Nike"; Click("Delete Brand")
  * Output: (Return to Homepage, Nike not listed)

11. Each brand can be featured in multiple stores, each store can carry multiple brands.

## Support and contact details

_Contact Jonathan at: jonathan.thom1990@gmail.com_

## Technologies Used

_Ruby, Sinatra, ActiveRecord, HTML, CSS, Bootstrap_

### License

*MIT*

Copyright (c) 2016 **_Jonathan Thom_**
