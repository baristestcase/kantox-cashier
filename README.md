# Kantox::Cashier

Hi! I generated a gem project to implement the task just because it gives a familiar structure to everyone.
I used MiniTest because didn't want to add a big dependency like RSpec for a small task. Normally I use RSpec in company projects.

## Installation

You will need ruby >= 3.1, to install with rbenv;

    $ rbenv install 3.1.2
    $ rbenv shell 3.1.2

## Usage

There are ~20 test specs under ./test folder. If you run;

    $ ./bin/setup

it will automatically install gems, runs tests and rubocop.

then, you can get into irb session with;

    $ ./bin/console

in there you can get predefined items like this;

```ruby
irb> cf1_item = Kantox::Cashier::Item.cf1_item
=> {:code=>:CF1, :price=>11.23, :name=>"Coffee"}

irb> cf1_item = Kantox::Cashier::Item.cf1_item
=> {:code=>:SR1, :price=>5.0, :name=>"Strawberries"}

irb> gr1_item = Kantox::Cashier::Item.gr1_item
=> {:code=>:GR1, :price=>3.11, :name=>"Green tea"}
```

then you can create a `Checkout` object with default promotion rules;

```ruby
irb> checkout = Kantox::Cashier::Checkout.new
=> #<Kantox::Cashier::Checkout:0x000000010485ed50
```

if you want to define your own rules;
i.e; customers can get %50 discount for 5 or more Green Tea orders;

```ruby
irb> pricing_rule = Kantox::Cashier::PromotionRules::DiscountRule.new(discount:0.5, order_count: 5, product_code: :GR)
=> #<Kantox::Cashier::PromotionRules::DiscountRule:0x0000000104855070 @discount=0.5, @order_count=5, @product_code=:GR>
```

then you can create `Checkout` object with this new rule;

```ruby
irb> checkout = Kantox::Cashier::Checkout.new(pricing_rules: [pricing_rule])
=> #<Kantox::Cashier::Checkout:0x0000000100e094e8
```
or you can define multiple rules and generate a checkout object with those rules.

`Checkout` class only consider latest defined rule if there's multiple rules for the same product. 
i.e; if you defined 3 rules for GR1 and 5 rules for SR1, `Checkout` class only consider the latter one.  

to scan and get the total price;

```ruby

irb> checkout.scan(gr1_item)
=> 1
irb> checkout.scan(sr1_item)
=> 1
irb> checkout.scan(gr1_item)
=> 2
irb> checkout.scan(gr1_item)
=> 3
irb> checkout.scan(cf1_item)
=> 1
irb> checkout.total
=> "£22.45"
```

