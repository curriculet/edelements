 module EdelementsHelper
   def set_testing_configuration
     Edelements.reset!
     Edelements.api_key  = edelements_api_key
     Edelements.endpoint = 'http://johnson-test-1.edelements.com'
     Edelements.testing  = true
   end

   def edelements_api_key
     '7ecb0c9c-cca6-11e3-97de-22000aa43193'
   end

   def edelements_organization_id
     'b8eaf45c-cca9-11e3-97de-22000aa43193'
   end
 end
