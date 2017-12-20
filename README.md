# README

Tools: Rails 5.0.6, Ruby 2.3.1p112
This application implements following APIs:

* **Add a product**:
(server_url/add_product.json?product[product_type]=sasaasssdsd211212sdsdsdasasdsswewew2323dsddsasassaas&product[category]=sdsdlulz&product[custom_id]=lozlolzlsdsdsolz). This API needs 3 attributes: product_type, category and custom_id, each of these attributes must be inside _**product**_ key. Products with same product_type, category and custom_id are considered same(not similar).

* **Get top products**:
(server_url/top_products.json?count=2)(count is optional and defaults to 10)
This displays top products(id, product_type, category and custom_id) by count ingested through above API.


This application uses in memory Count min sketch to keep track of products which means upon restarting the server, this data will be cleared and you have to start over by inserting new products.
