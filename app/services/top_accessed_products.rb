module TopAccessedProducts
  def self.add_product(product:)
    p = product
    $cm_store.insert(p.id)
    update_top(p.id)
  end

  def self.update_top(product_id)
    product_count = $cm_store.get_count(product_id)
    least_occuring_key, least_occuring_value = $pq.sort_by{|k,v| v}.first

    if $pq.keys.size >= MAX_SIZE
      unless $pq.key?(product_id)
        if product_count > least_occuring_value
          $pq.delete(least_occuring_key)
          $pq[product_id] = product_count
        end
      else
        $pq[product_id] = product_count
      end
    else
      $pq[product_id] = product_count
    end
  end

  def self.top_products(num_products=MAX_SIZE)
    num_products = [num_products.to_i, MAX_SIZE].min
    #0th member in x(x[0]) is product id
    product_details = $pq.sort_by{|k,v| v}.reverse.map{|x| x[0]}[0..num_products - 1]
    product_details.map {|k, v| Product.find_by_id(k)}.compact
  end
end
