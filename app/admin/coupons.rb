ActiveAdmin.register Coupon do
  permit_params :discount_code, :description, :amount
  
  form do |f|
  f.semantic_errors
  f.inputs 
  f.actions
  end
end
