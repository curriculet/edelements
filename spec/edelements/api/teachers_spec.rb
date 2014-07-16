require 'spec_helper'

describe Edelements::Api::Teachers,  :vcr => { :cassette_name => "teachers" } do

  before { set_testing_configuration }

  context '#show' do
    let(:teacher){ Edelements.teachers.show( edelements_teacher_id ) }

    it "should return result" do
      expect(teacher).to_not be_nil
    end

    it 'should be Edelements::Teacher' do
      expect(teacher).to be_an_instance_of( Edelements::Teacher )
    end

    it 'should has id key' do
      expect(teacher).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(teacher).to respond_to(:schoolID)
    end

    it 'should has firstName key' do
      expect(teacher).to respond_to(:firstName)
    end

    it 'should has lastName key' do
      expect(teacher).to respond_to(:lastName)
    end

    it 'should has middleName key' do
      expect(teacher).to respond_to(:middleName)
    end

    it 'should has email key' do
      expect(teacher).to respond_to(:email)
    end

    it 'should has number key' do
      expect(teacher).to respond_to(:number)
    end

    it 'should has lastUpdate key' do
      expect(teacher).to respond_to(:lastUpdate)
    end

    it 'should has courseEnrollments key' do
      expect(teacher).to respond_to(:courseEnrollments)
    end

    it 'should has courseEnrollments[:enrolment] key' do
      expect(teacher.courseEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has courseEnrollments should be Array' do
      expect(teacher.courseEnrollments).to be_an_instance_of(Array)
    end

    it 'should has courseEnrollments[:startDate] key' do
      expect(teacher.courseEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has courseEnrollments[:courseID] key' do
      expect(teacher.courseEnrollments[0].enrollment).to respond_to(:courseID)
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      expect(teacher.courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has courseEnrollments[:role] key' do
      expect(teacher.courseEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has courseEnrollments[:endDate] key' do
      expect(teacher.courseEnrollments[0].enrollment).to respond_to(:endDate)
    end

    it 'should has address key' do
      expect(teacher).to respond_to(:address)
    end

    it 'should has address[:street2] key' do
      expect(teacher.address).to respond_to(:street2)
    end

    it 'should has address[:street1] key' do
      expect(teacher.address).to respond_to(:street1)
    end

    it 'should has address[:zip] key' do
      expect(teacher.address).to respond_to(:zip)
    end

    it 'should has address[:state] key' do
      expect(teacher.address).to respond_to(:state)
    end

    it 'should has address[:city] key' do
      expect(teacher.address).to respond_to(:city)
    end
  end

  context '#students' do
    let(:students){ Edelements.teachers.students(edelements_teacher_id) }

    it "should return not empty array" do
      expect(students).to_not be_nil
    end

    it 'should be array' do
      expect(students).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(students.length).to_not be_zero
    end

    it 'should be Edelements::Student' do
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

    it 'should has properties key' do
      expect(students[0]).to respond_to(:properties)
    end
  end

  context '#courses' do
    let(:courses){ Edelements.teachers.courses(edelements_teacher_id) }

    it "should return not empty array" do
      expect(courses).to_not be_nil
    end

    it 'should be array' do
      expect(courses).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(courses.length).to_not be_zero
    end

    it 'should be Edelements::Course' do
      expect(courses[0]).to be_an_instance_of( Edelements::Course )
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

    it 'should has properties["End Date"] key' do
      expect(courses[0].properties).to respond_to('End Date')
    end

    it 'should has properties["Start Date"] key' do
      expect(courses[0].properties).to respond_to('Start Date')
    end

    it 'should has lastUpdate key' do
      expect(courses[0]).to respond_to(:lastUpdate)
    end


  end

  context '#events' do
    let(:events){ Edelements.teachers.events(edelements_teacher_id) }

    it "should return not empty array" do
      expect(events).to_not be_nil
    end

    it 'should be array' do
      expect(events).to be_an_instance_of( Array )
    end

    it 'should should be > 0' do
      expect(events.length).to_not be_zero
    end

    it 'should be Edelements::Event' do
      expect(events[0]).to be_an_instance_of( Edelements::Event )
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

    it 'should params[:userID] key' do
      expect(events[0].params).to respond_to(:userID)
    end
  end

end
