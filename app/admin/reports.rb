ActiveAdmin.register_page "Reports" do
  content do
    panel "Total Price by Month" do
      table_for Order.select("MONTH(created_at) as month, sum(subtotal) as total_price")
                  .group(:month)
                  .order(:month) do
        column "Month", :month
        column "Total Price", :total_price do |report|
          number_to_currency report.total_price
        end
      end
    end
  end
end
