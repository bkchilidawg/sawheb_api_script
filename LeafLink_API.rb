require 'bundler/setup'
require 'httparty'
require 'csv'

class LeafLinkAPI
  BASE_URL = 'https://www.leaflink.com/api/v2/orders-received'.freeze

  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_orders
    response = HTTParty.get(BASE_URL, headers: {
      'Authorization' => "Bearer #{@api_key}",
      'Content-Type' => 'application/json'
    })
    # puts "API Response Body: #{response.body}" 
    data = JSON.parse(response.body) # Parse response body as JSON

    # puts "API Response Data: #{data.inspect}" # Debugging output

    if data.is_a?(Array) && data.first.is_a?(Hash)
      write_to_csv(data)
    else
      puts "Error: Unexpected data format received from API"
    end
  end

  private

def write_to_csv(data)
  CSV.open('orders.csv', 'w') do |csv|
    csv << [
      "number", "short_id", "external_id_seller", "external_id_buyer", "ext_acct_id", "created_on", "user", "buyer", "seller", "customer_id", "customer_display_name", "brand", "status", "manual", "discount", "discount_type", "tax_amount", "tax_type", "final_tax", "shipping_charge_amount", "shipping_charge_currency", "total_amount", "total_currency", "payment_term", "payment_methods", "selected_payment_option_id", "selected_payment_option_is_default", "selected_payment_option_payment_program", "selected_payment_option_payment_strategy", "selected_payment_option_payment_method_id", "selected_payment_option_payment_method", "selected_payment_option_payment_term_id", "selected_payment_option_payment_term", "selected_payment_option_days", "selected_payment_option_code", "payment_due_date", "paid", "paid_date", "ship_date", "shipping_details", "notes", "internal_notes", "delivery_preferences", "sales_reps", "classification", "payment_balance", "available_transitions", "modified", "has_special_requests", "delivery_provider", "order_taxes", "delivery_info", "is_combination", "credits", "facility_id", "order_number", "order_seller_number", "order_buyer_number", "order_short_number", "distributor", "external_ids_system_name", "corporate_address_address", "corporate_address_city", "corporate_address_state", "corporate_address_unit_number", "corporate_address_zipcode", "delivery_address_address", "delivery_address_city", "delivery_address_state", "delivery_address_unit_number", "delivery_address_zipcode"
    ]

    data["results"].each do |order|
      csv << [
        order["number"],
        order["short_id"],
        order["external_id_seller"],
        order["external_id_buyer"],
        order["ext_acct_id"],
        order["created_on"],
        order["user"],
        order["buyer"],
        order["seller"],
        order["customer"]["id"],
        order["customer"]["display_name"],
        order["brand"],
        order["status"],
        order["manual"],
        order["discount"],
        order["discount_type"],
        order["tax_amount"],
        order["tax_type"],
        order["final_tax"],
        order["shipping_charge"]["amount"],
        order["shipping_charge"]["currency"],
        order["total"]["amount"],
        order["total"]["currency"],
        order["payment_term"],
        order["selected_payment_option"]["id"],
        order["selected_payment_option"]["is_default"],
        order["selected_payment_option"]["payment_program"],
        order["selected_payment_option"]["payment_strategy"],
        order["selected_payment_option"]["payment_method"]["id"],
        order["selected_payment_option"]["payment_method"]["method"],
        order["selected_payment_option"]["payment_term"]["id"],
        order["selected_payment_option"]["payment_term"]["term"],
        "", # selected_payment_option_days - data not available
        "", # selected_payment_option_code - data not available
        order["payment_due_date"],
        order["paid"],
        order["paid_date"],
        order["ship_date"],
        order["shipping_details"],
        order["notes"],
        order["internal_notes"],
        order["delivery_preferences"],
        order["sales_reps"].map { |rep| "#{rep["id"]}: #{rep["user"]}" }.join(","),
        order["classification"],
        order["payment_balance"],
        order["available_transitions"].join(","),
        order["modified"],
        order["has_special_requests"],
        order["delivery_provider"],
        order["order_taxes"].join(","),
        order["delivery_info"],
        order["is_combination"],
        order["credits"],
        order["facility_id"],
        order["order_number"],
        order["order_seller_number"],
        order["order_buyer_number"],
        order["order_short_number"],
        order["distributor"],
        order["external_ids"]["system-name"],
        order["corporate_address"]["address"],
        order["corporate_address"]["city"],
        order["corporate_address"]["state"],
        order["corporate_address"]["unit_number"],
        order["corporate_address"]["zipcode"],
        order["delivery_address"]["address"],
        order["delivery_address"]["city"],
        order["delivery_address"]["state"],
        order["delivery_address"]["unit_number"],
        order["delivery_address"]["zipcode"]
      ]
    end
  end
end


end

# Usage
api = LeafLinkAPI.new('500348657931753de27c241ce7f17b8da4519c4fb48cacade56f45c02c4086bc')
api.fetch_orders
