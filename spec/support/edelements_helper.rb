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

   def edelements_school_id
     '6ec15b8a-5226-11e3-af88-12313d151e4b'
   end

   def edelements_teacher_id
     'a6fb900f-495e-4b35-880f-bc582c850f6b'
   end

   def edelements_student_id
     'a3a829b0-914c-4e2e-a7d6-67aa0cbea434'
   end

   def edelements_course_id
     '8bcc2d23-bdf8-4a3d-accf-b780c14afb5f'
   end
 end
