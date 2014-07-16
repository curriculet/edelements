require 'spec_helper'

describe Edelements::Api::Organizations,  :vcr => { :cassette_name => "organizations" } do

  before { set_testing_configuration }

  context '#list' do
    let(:organizations){ Edelements.organizations.list }

    it "should return not empty array" do
      expect(organizations).to_not be_nil
    end

    it 'should be array' do
      expect(organizations).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(organizations.length).to_not be_zero
    end

    it 'should be array of Edelements::Organization' do
      expect(organizations[0]).to be_an_instance_of( Edelements::Organization )
    end
    it 'should has id key' do
      expect(organizations[0]).to respond_to(:id)
    end

    it 'should has nameField key' do
      expect(organizations[0]).to respond_to(:nameField)
    end

    it 'should has typeField key' do
      expect(organizations[0]).to respond_to(:typeField)
    end
  end

  context '#show' do
    let(:organization){ Edelements.organizations.show(edelements_organization_id) }

    it "should return result" do
      expect(organization).to_not be_nil
    end

    it 'should be hash' do
      expect(organization).to be_an_instance_of( Edelements::Organization )
    end

    it 'should has id key' do
      expect(organization).to respond_to(:id)
    end

    it 'should has nameField key' do
      expect(organization).to respond_to(:nameField)
    end

    it 'should has typeField key' do
      expect(organization).to respond_to(:typeField)
    end
  end

  context '#organizations' do
    let(:organizations){ Edelements.organizations.organizations(edelements_organization_id) }

    it "should return result" do
      expect(organizations).to_not be_nil
    end

    it 'should be hash' do
      expect(organizations).to be_an_instance_of( Array )
    end
  end

  context '#schools' do
    let(:schools){ Edelements.organizations.schools(edelements_organization_id) }

    it "should return not empty array" do
      expect(schools).to_not be_nil
    end

    it 'should be array' do
      expect(schools).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(schools.length).to_not be_zero
    end

    it 'should be array of Edelements::School' do
      expect(schools[0]).to be_an_instance_of( Edelements::School )
    end

    it 'should has id key' do
      expect(schools[0]).to respond_to(:id)
    end

    it 'should has name key' do
      expect(schools[0]).to respond_to(:name)
    end

    it 'should has address key' do
      expect(schools[0]).to respond_to(:address)
    end

    it 'should has properties key' do
      expect(schools[0]).to respond_to(:properties)
    end
  end


  context '#teachers' do
    let(:teachers){ Edelements.organizations.teachers(edelements_organization_id) }

    it "should return not empty array" do
      expect(teachers).to_not be_nil
    end

    it 'should be array' do
      expect(teachers).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(teachers.length).to_not be_zero
    end

    it 'should be array of Edelements::Teacher' do
      expect(teachers[0]).to be_an_instance_of( Edelements::Teacher )
    end

    it 'should has id key' do
      expect(teachers[0]).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(teachers[0]).to respond_to(:schoolID)
    end

    it 'should has firstName key' do
      expect(teachers[0]).to respond_to(:firstName)
    end

    it 'should has lastName key' do
      expect(teachers[0]).to respond_to(:lastName)
    end

    it 'should has middleName key' do
      expect(teachers[0]).to respond_to(:middleName)
    end

    it 'should has email key' do
      expect(teachers[0]).to respond_to(:email)
    end

    it 'should has courseEnrollments key' do
      expect(teachers[0]).to respond_to(:courseEnrollments)
    end

    it 'should has courseEnrollments[:enrolment] key' do
      expect(teachers[0].courseEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has courseEnrollments should be Array' do
      expect(teachers[0].courseEnrollments).to be_an_instance_of(Array)
    end

    it 'should has courseEnrollments[:startDate] key' do
      expect(teachers[0].courseEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has courseEnrollments[:courseID] key' do
      expect(teachers[0].courseEnrollments[0].enrollment).to respond_to(:courseID)
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      expect(teachers[0].courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has courseEnrollments[:role] key' do
      expect(teachers[0].courseEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has courseEnrollments[:endDate] key' do
      expect(teachers[0].courseEnrollments[0].enrollment).to respond_to(:endDate)
    end

    it 'should has address key' do
      expect(teachers[0]).to respond_to(:address)
    end

    it 'should has address[:street2] key' do
      expect(teachers[0].address).to respond_to(:street2)
    end

    it 'should has address[:street1] key' do
      expect(teachers[0].address).to respond_to(:street1)
    end

    it 'should has address[:zip] key' do
      expect(teachers[0].address).to respond_to(:zip)
    end

    it 'should has address[:state] key' do
      expect(teachers[0].address).to respond_to(:state)
    end

    it 'should has address[:city] key' do
      expect(teachers[0].address).to respond_to(:city)
    end
  end

  context '#students' do
    let(:students){ Edelements.organizations.students(edelements_organization_id) }

    it "should return not empty array" do
      expect(students).to_not be_nil
    end

    it 'should be array' do
      expect(students).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(students.length).to_not be_zero
    end

    it 'should be array of Edelements::Student' do
      expect(students[0]).to be_an_instance_of( Edelements::Student )
    end

    it 'should has id key' do
      expect(students[0]).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(students[0]).to respond_to(:schoolID)
    end

    it 'should has firstName key' do
      expect(students[0]).to respond_to(:firstName)
    end

    it 'should has lastName key' do
      expect(students[0]).to respond_to(:lastName)
    end

    it 'should has middleName key' do
      expect(students[0]).to respond_to(:middleName)
    end

    it 'should has email key' do
      expect(students[0]).to respond_to(:email)
    end

    it 'should has number key' do
      expect(students[0]).to respond_to(:number)
    end

    it 'should has gradeLevel key' do
      expect(students[0]).to respond_to(:gradeLevel)
    end

    it 'should has courseEnrollments key' do
      expect(students[0]).to respond_to(:courseEnrollments)
    end

    it 'should has courseEnrollments[:enrolment] key' do
      expect(students[0].courseEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has courseEnrollments should be Array' do
      expect(students[0].courseEnrollments).to be_an_instance_of(Array)
    end

    it 'should has courseEnrollments[:startDate] key' do
      expect(students[0].courseEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has courseEnrollments[:courseID] key' do
      expect(students[0].courseEnrollments[0].enrollment).to respond_to(:courseID)
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      expect(students[0].courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has courseEnrollments[:role] key' do
      expect(students[0].courseEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has courseEnrollments[:endDate] key' do
      expect(students[0].courseEnrollments[0].enrollment).to respond_to(:endDate)
    end

    it 'should has address key' do
      expect(students[0]).to respond_to(:address)
    end

    it 'should has address[:street2] key' do
      expect(students[0].address).to respond_to(:street2)
    end

    it 'should has address[:street1] key' do
      expect(students[0].address).to respond_to(:street1)
    end

    it 'should has address[:zip] key' do
      expect(students[0].address).to respond_to(:zip)
    end

    it 'should has address[:state] key' do
      expect(students[0].address).to respond_to(:state)
    end

    it 'should has address[:city] key' do
      expect(students[0].address).to respond_to(:city)
    end

  end

  context '#courses' do
    let(:courses){ Edelements.organizations.courses(edelements_organization_id) }

    it "should return not empty array" do
      expect(courses).to_not be_nil
    end

    it 'should be array' do
      expect(courses).to be_an_instance_of( Array )
    end
    it 'should be array of Edelements::Course' do
      expect(courses[0]).to be_an_instance_of( Edelements::Course )
    end
    it 'should should be > 0' do
      expect(courses.length).to_not be_zero
    end

    it 'should has id key' do
      expect(courses[0]).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(courses[0]).to respond_to(:schoolID)
    end

    it 'should has name key' do
      expect(courses[0]).to respond_to(:name)
    end

    it 'should has schoolYear key' do
      expect(courses[0]).to respond_to(:schoolYear)
    end

    it 'should has properties key' do
      expect(courses[0]).to respond_to(:properties)
    end

    it 'should has lastUpdate key' do
      expect(courses[0]).to respond_to(:lastUpdate)
    end

    it 'should has teacherEnrollments key' do
      expect(courses[0]).to respond_to(:teacherEnrollments)
    end

    it 'should has teacherEnrollments[:enrolment] key' do
      expect(courses[0].teacherEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has teacherEnrollments should be Array' do
      expect(courses[0].teacherEnrollments).to be_an_instance_of(Array)
    end

    it 'should has teacherEnrollments[:startDate] key' do
      expect(courses[0].teacherEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has teacherEnrollments[:userID] key' do
      expect(courses[0].teacherEnrollments[0].enrollment).to respond_to(:userID)
    end

    it 'should has teacherEnrollments[:lastUpdate] key' do
      expect(courses[0].teacherEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has teacherEnrollments[:role] key' do
      expect(courses[0].teacherEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has teacherEnrollments[:endDate] key' do
      expect(courses[0].teacherEnrollments[0].enrollment).to respond_to(:endDate)
    end

    it 'should has studentEnrollments key' do
      expect(courses[0]).to respond_to(:studentEnrollments)
    end

    it 'should has studentEnrollments[:enrolment] key' do
      expect(courses[0].studentEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has studentEnrollments should be Array' do
      expect(courses[0].studentEnrollments).to be_an_instance_of(Array)
    end

    it 'should has studentEnrollments[:startDate] key' do
      expect(courses[0].studentEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has studentEnrollments[:userID] key' do
      expect(courses[0].studentEnrollments[0].enrollment).to respond_to(:userID)
    end

    it 'should has studentEnrollments[:lastUpdate] key' do
      expect(courses[0].studentEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has studentEnrollments[:role] key' do
      expect(courses[0].studentEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has studentEnrollments[:endDate] key' do
      expect(courses[0].studentEnrollments[0].enrollment).to respond_to(:endDate)
    end
  end

  context '#events' do
    let(:events){ Edelements.organizations.events(edelements_organization_id) }

    it "should return not empty array" do
      expect(events).to_not be_nil
    end

    it 'should be array' do
      expect(events).to be_an_instance_of( Array )
    end
    it 'should be array of Edelements::Event' do
      expect(events[0]).to be_an_instance_of( Edelements::Event )
    end
    it 'should should be > 0' do
      expect(events.length).to_not be_zero
    end

    it 'should has id key' do
      expect(events[0]).to respond_to(:id)
    end

    it 'should has timestamp key' do
      expect(events[0]).to respond_to(:timestamp)
    end

    it 'should has eventtype key' do
      expect(events[0]).to respond_to(:eventtype)
    end

    it 'should has eventaction key' do
      expect(events[0]).to respond_to(:eventaction)
    end

    it 'should has params key' do
      expect(events[0]).to respond_to(:params)
    end

    it 'should params[:courseID] key' do
      expect(events[0].params).to respond_to(:courseID)
    end
  end

end