require 'rspec'
require 'webmock/rspec'
require_relative '../LeafLink_API'
require 'csv'

RSpec.describe LeafLinkAPI do
  before do
    stub_request(:get, "https://www.leaflink.com/api/v2/orders-received").
      with(
        headers: {
          'Authorization'=>'Bearer YOUR_ACCESS_TOKEN',
          'Content-Type'=>'application/json'
        }).
      to_return(status: 200, body: JSON.generate({
        "count"=>2,
        "next"=>nil,
        "previous"=>nil,
        "results"=>[
          {
            "number"=>"aec108ac-a1f4-40fa-966e-a12ga9bf6e2f",
            "short_id"=>"a9bf6e2f",
            "external_id_seller"=>nil,
            "external_id_buyer"=>nil,
            "ext_acct_id"=>nil,
            "created_on"=>"2020-06-10T15:15:03.776119-06:00",
            "user"=>"james.g",
            "buyer"=>6109,
            "seller"=>1,
            "customer"=>{"id"=>148515, "display_name"=>"Good Vibrations Dispensary", "ext_acct_id"=>nil, "delinquent"=>false},
            "brand"=>nil,
            "status"=>"Accepted",
            "manual"=>false,
            "discount"=>0,
            "discount_type"=>"%",
            "tax_amount"=>0,
            "tax_type"=>"%",
            "final_tax"=>"0.00",
            "shipping_charge"=>{"amount"=>0, "currency"=>"USD"},
            "total"=>{"amount"=>594, "currency"=>"USD"},
            "payment_term"=>"Net 7",
            "payment_methods"=>["Cash", "ACH"],
            "available_payment_options"=>[{"id"=>216377, "is_default"=>true, "payment_program"=>"flexible", "payment_strategy"=>"reverse_factored", "payment_method"=>{"id"=>4, "method"=>"ACH"}, "payment_term"=>{"id"=>3, "term"=>"Net 15", "days"=>15, "code"=>"net15"}}, {"id"=>216375, "is_default"=>false, "payment_program"=>nil, "payment_strategy"=>nil, "payment_method"=>{"id"=>1, "method"=>"Cash"}, "payment_term"=>{"id"=>20, "term"=>"COD", "days"=>nil, "code"=>"cod"}}],
            "selected_payment_option"=>{"id"=>1732313, "is_default"=>true, "payment_program"=>"flexible", "payment_strategy"=>"reverse_factored", "payment_method"=>{"id"=>4, "method"=>"ACH"}, "payment_term"=>{"id"=>3, "term"=>"Net 15", "days"=>15, "code"=>"net15"}},
            "payment_due_date"=>nil,
            "paid"=>false,
            "paid_date"=>nil,
            "ship_date"=>nil,
            "shipping_details"=>nil,
            "notes"=>"",
            "internal_notes"=>nil,
            "delivery_preferences"=>"Monday - Wednesday Only Please",
            "sales_reps"=>[{"id"=>13, "user"=>"John Doe"}],
            "classification"=>"Adult Use",
            "payment_balance"=>594,
            "available_transitions"=>["fulfilled", "rejected"],
            "modified"=>"2020-06-10T16:14:49.494713-06:00",
            "has_special_requests"=>false,
            "delivery_provider"=>nil,
            "order_taxes"=>[],
            "delivery_info"=>nil,
            "is_combination"=>false,
            "credits"=>"0.00",
            "facility_id"=>123,
            "order_number"=>"aec108ac-a1f4-40fa-966e-a12ga9bf6e2f",
            "order_seller_number"=>"a9bf6e2f",
            "order_buyer_number"=>"a9bf6e2f",
            "order_short_number"=>"a9bf6e2f",
            "distributor"=>"",
            "external_ids"=>{"system-name"=>"45897"},
            "corporate_address"=>{"address"=>"17034 Highway 10", "city"=>"Moffat", "state"=>"CO", "unit_number"=>"1A", "zipcode"=>"81143"},
            "delivery_address"=>{"address"=>"17034 Highway 17", "city"=>"Moffat", "state"=>"CO", "unit_number"=>"1A", "zipcode"=>"81143"}
          },
          {
            "number"=>"4165a155-979b-4e6e-b3a5-8ef917ce9491",
            "short_id"=>"17ce9491",
            "external_id_seller"=>nil,
            "external_id_buyer"=>nil,
            "ext_acct_id"=>nil,
            "created_on"=>"2020-06-10T13:34:10.663097-06:00",
            "user"=>"scooter.s",
            "buyer"=>3109,
            "seller"=>1,
            "customer"=>{"id"=>26032, "display_name"=>"New Leaf", "ext_acct_id"=>nil, "delinquent"=>false},
            "brand"=>nil,
            "status"=>"Accepted",
            "manual"=>true,
            "discount"=>0,
            "discount_type"=>"%",
            "tax_amount"=>0,
            "tax_type"=>"%",
            "final_tax"=>"0.00",
            "shipping_charge"=>{"amount"=>0, "currency"=>"USD"},
            "total"=>{"amount"=>210.4, "currency"=>"USD"},
            "payment_term"=>"COD",
            "payment_methods"=>["Wire Transfer"],
            "payment_due_date"=>nil,
            "paid"=>false,
            "paid_date"=>nil,
            "ship_date"=>nil,
            "shipping_details"=>nil,
            "notes"=>"Mary can process on 6/15",
            "internal_notes"=>nil,
            "delivery_preferences"=>"",
            "sales_reps"=>[{"id"=>5659, "user"=>"Jane Doe"}],
            "classification"=>"Adult Use",
            "payment_balance"=>210.4,
            "available_transitions"=>["fulfilled", "rejected"],
            "modified"=>"2020-06-10T16:04:40.312860-06:00",
            "has_special_requests"=>true,
            "delivery_provider"=>nil,
            "order_taxes"=>[],
            "delivery_info"=>nil,
            "is_combination"=>false,
            "credits"=>"45.01",
            "facility_id"=>123,
            "order_number"=>"4165a155-979b-4e6e-b3a5-8ef917ce9491",
            "order_seller_number"=>"17ce9491",
            "order_buyer_number"=>"17ce9491",
            "order_short_number"=>"17ce9491",
            "distributor"=>"",
            "external_ids"=>{},
            "corporate_address"=>{"address"=>"Some Address 2", "city"=>"Moffat", "state"=>"CO", "unit_number"=>"1A", "zipcode"=>"81143"},
            "delivery_address"=>{"address"=>"Some Address 1", "city"=>"Moffat", "state"=>"CO", "unit_number"=>"1A", "zipcode"=>"81143"}
          }
        ]
      }), headers: {})
  end

  describe '#fetch_orders' do
    it 'writes the correct data to the CSV file' do
      api = LeafLinkAPI.new('YOUR_ACCESS_TOKEN')
      api.fetch_orders


      
      csv_content = CSV.read('orders.csv')
      expected_csv_content = [
        ["number", "short_id", "external_id_seller", "external_id_buyer", "ext_acct_id", "created_on", "user", "buyer", "seller", "customer_id", "customer_display_name", "brand", "status", "manual", "discount", "discount_type", "tax_amount", "tax_type", "final_tax", "shipping_charge_amount", "shipping_charge_currency", "total_amount", "total_currency", "payment_term", "payment_methods", "selected_payment_option_id", "selected_payment_option_default", "selected_payment_option_program", "selected_payment_option_strategy", "selected_payment_option_method_id", "selected_payment_option_method", "selected_payment_option_term_id", "selected_payment_option_term", "selected_payment_option_days", "selected_payment_option_code", "payment_due_date", "paid", "paid_date", "ship_date", "shipping_details", "notes", "internal_notes", "delivery_preferences", "sales_reps", "classification", "payment_balance", "available_transitions", "modified", "has_special_requests", "delivery_provider", "order_taxes", "delivery_info", "is_combination", "credits", "facility_id", "order_number", "order_seller_number", "order_buyer_number", "order_short_number", "distributor", "external_ids_system-name", "corporate_address_address", "corporate_address_city", "corporate_address_state", "corporate_address_unit_number", "corporate_address_zipcode", "delivery_address_address", "delivery_address_city", "delivery_address_state", "delivery_address_unit_number", "delivery_address_zipcode"],
        ["aec108ac-a1f4-40fa-966e-a12ga9bf6e2f", "a9bf6e2f", nil, nil, nil, "2020-06-10T15:15:03.776119-06:00", "james.g", 6109, 1, 148515, "Good Vibrations Dispensary", nil, "Accepted", false, 0, "%", 0, "%", "0.00", 0, "USD", 594, "USD", "Net 7", "Cash,ACH", 1732313, true, "flexible", "reverse_factored", 4, "ACH", 3, "Net 15", 15, "net15", nil, false, nil, nil, nil, "", "", nil, "Monday - Wednesday Only Please", "[{\"id\"=>13, \"user\"=>\"John Doe\"}]", "Adult Use", 594, "[\"fulfilled\", \"rejected\"]", "2020-06-10T16:14:49.494713-06:00", false, nil, nil, nil, "", "", nil, false, "0.00", 123, "aec108ac-a1f4-40fa-966e-a12ga9bf6e2f", "a9bf6e2f", "a9bf6e2f", "a9bf6e2f", "", "45897", "17034 Highway 10", "Moffat", "CO", "1A", "81143", "17034 Highway 17", "Moffat", "CO", "1A", "81143"],
        ["4165a155-979b-4e6e-b3a5-8ef917ce9491", "17ce9491", nil, nil, nil, "2020-06-10T13:34:10.663097-06:00", "scooter.s", 3109, 1, 26032, "New Leaf", nil, "Accepted", true, 0, "%", 0, "%", "0.00", 0, "USD", 210.4, "USD", "COD", "Wire Transfer", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "", "Mary can process on 6/15", "", "", "[{\"id\"=>5659, \"user\"=>\"Jane Doe\"}]", "Adult Use", 210.4, "[\"fulfilled\", \"rejected\"]", "2020-06-10T16:04:40.312860-06:00", true, nil, nil, nil, "", "", nil, false, "45.01", 123, "4165a155-979b-4e6e-b3a5-8ef917ce9491", "17ce9491", "17ce9491", "17ce9491", "", "", "Some Address 2", "Moffat", "CO", "1A", "81143", "Some Address 1", "Moffat", "CO", "1A", "81143"]
      ]
        puts "Actual CSV Content: #{csv_content.inspect}"
      puts "Expected CSV Content: #{expected_csv_content.inspect}"
      expect(csv_content).to eq(expected_csv_content)
    end
  end
end
