require 'spec_helper'

describe Edelements::Api::Students,  :vcr => { :cassette_name => "students" } do

  before { set_testing_configuration }

  context '#show' do
    let(:student){ Edelements.students.show( edelements_student_id ) }

    it "should return not empty array" do
      expect(student).to_not be_nil
    end

    it 'should be Edelements::Student' do
      expect(student).to be_an_instance_of( Edelements::Student )
    end

    it 'should should be > 0' do
      expect(student.length).to_not be_zero
    end

    it 'should has id key' do
      expect(student).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(student).to respond_to(:schoolID)
    end

    it 'should has firstName key' do
      expect(student).to respond_to(:firstName)
    end

    it 'should has lastName key' do
      expect(student).to respond_to(:lastName)
    end

    it 'should has middleName key' do
      expect(student).to respond_to(:middleName)
    end

    it 'should has email key' do
      expect(student).to respond_to(:email)
    end

    it 'should has number key' do
      expect(student).to respond_to(:number)
    end

    it 'should has gradeLevel key' do
      expect(student).to respond_to(:gradeLevel)
    end

    it 'should has properties key' do
      expect(student).to respond_to(:properties)
    end

    it 'should has courseEnrollments key' do
      expect(student).to respond_to(:courseEnrollments)
    end

    it 'should has courseEnrollments[:enrolment] key' do
      expect(student.courseEnrollments[0]).to respond_to(:enrollment)
    end

    it 'should has courseEnrollments should be Array' do
      expect(student.courseEnrollments).to be_an_instance_of(Array)
    end

    it 'should has courseEnrollments[:startDate] key' do
      expect(student.courseEnrollments[0].enrollment).to respond_to(:startDate)
    end

    it 'should has courseEnrollments[:courseID] key' do
      expect(student.courseEnrollments[0].enrollment).to respond_to(:courseID)
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      expect(student.courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
    end

    it 'should has courseEnrollments[:role] key' do
      expect(student.courseEnrollments[0].enrollment).to respond_to(:role)
    end

    it 'should has courseEnrollments[:endDate] key' do
      expect(student.courseEnrollments[0].enrollment).to respond_to(:endDate)
    end

    it 'should has address key' do
      expect(student).to respond_to(:address)
    end

    it 'should has address[:street2] key' do
      expect(student.address).to respond_to(:street2)
    end

    it 'should has address[:street1] key' do
      expect(student.address).to respond_to(:street1)
    end

    it 'should has address[:zip] key' do
      expect(student.address).to respond_to(:zip)
    end

    it 'should has address[:state] key' do
      expect(student.address).to respond_to(:state)
    end

    it 'should has address[:city] key' do
      expect(student.address).to respond_to(:city)
    end
  end

  context '#teachers' do
    let(:teachers){ Edelements.students.teachers(edelements_student_id) }

    it "should return not empty array" do
      expect(teachers).to_not be_nil
    end

    it 'should be array' do
      expect(teachers).to be_an_instance_of( Array )
    end

    it 'should be Edelements::Teacher' do
      expect(teachers[0]).to be_an_instance_of( Edelements::Teacher )
    end

    it 'should should be > 0' do
      expect(teachers.length).to_not be_zero
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

  context '#courses' do
    let(:courses){ Edelements.students.courses(edelements_student_id) }

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

    it 'should has lastUpdate key' do
      expect(courses[0]).to respond_to(:lastUpdate)
    end

  end

  context '#events' do
    let(:events){ Edelements.students.events( edelements_student_id ) }

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

    it 'should params[:courseID] key' do
      expect(events[0].params).to respond_to(:courseID)
    end

    it 'should params[:userID] key' do
      expect(events[0].params).to respond_to(:userID)
    end
  end

  context '#photo' do
    pending 'not working in server side'
  end

  context '#activity' do
    pending 'not working in server side'
  end
end
