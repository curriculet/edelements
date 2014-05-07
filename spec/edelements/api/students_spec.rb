require 'spec_helper'

describe Edelements::Api::Students do

  before { set_testing_configuration }

  context '#show' do
    let(:student){ Edelements.students.show( edelements_student_id ) }

    it "should return not empty array" do
      VCR.use_cassette("students") do
        expect(student).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("students") do
        expect(student).to be_an_instance_of( Edelements::Student )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('students') do
        expect(student.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:id)
      end
    end

    it 'should has schoolID key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:schoolID)
      end
    end

    it 'should has firstName key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:firstName)
      end
    end

    it 'should has lastName key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:lastName)
      end
    end

    it 'should has middleName key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:middleName)
      end
    end

    it 'should has email key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:email)
      end
    end

    it 'should has number key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:number)
      end
    end

    it 'should has gradeLevel key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:gradeLevel)
      end
    end

    it 'should has properties key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:properties)
      end
    end

    it 'should has courseEnrollments key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:courseEnrollments)
      end
    end

    it 'should has courseEnrollments[:enrolment] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0]).to respond_to(:enrollment)
      end
    end

    it 'should has courseEnrollments should be Array' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments).to be_an_instance_of(Array)
      end
    end

    it 'should has courseEnrollments[:startDate] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0].enrollment).to respond_to(:startDate)
      end
    end

    it 'should has courseEnrollments[:courseID] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0].enrollment).to respond_to(:courseID)
      end
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
      end
    end

    it 'should has courseEnrollments[:role] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0].enrollment).to respond_to(:role)
      end
    end

    it 'should has courseEnrollments[:endDate] key' do
      VCR.use_cassette('students') do
        expect(student.courseEnrollments[0].enrollment).to respond_to(:endDate)
      end
    end

    it 'should has address key' do
      VCR.use_cassette('students') do
        expect(student).to respond_to(:address)
      end
    end

    it 'should has address[:street2] key' do
      VCR.use_cassette('students') do
        expect(student.address).to respond_to(:street2)
      end
    end

    it 'should has address[:street1] key' do
      VCR.use_cassette('students') do
        expect(student.address).to respond_to(:street1)
      end
    end

    it 'should has address[:zip] key' do
      VCR.use_cassette('students') do
        expect(student.address).to respond_to(:zip)
      end
    end

    it 'should has address[:state] key' do
      VCR.use_cassette('students') do
        expect(student.address).to respond_to(:state)
      end
    end

    it 'should has address[:city] key' do
      VCR.use_cassette('students') do
        expect(student.address).to respond_to(:city)
      end
    end
  end

  context '#teachers' do
    let(:teachers){ Edelements.students.teachers(edelements_student_id) }

    it "should return not empty array" do
      VCR.use_cassette("teachers") do
        expect(teachers.data).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("teachers") do
        expect(teachers.data).to be_an_instance_of( Array )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('teachers') do
        expect(teachers.data.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:id)
      end
    end

    it 'should has schoolID key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:schoolID)
      end
    end

    it 'should has firstName key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:firstName)
      end
    end

    it 'should has lastName key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:lastName)
      end
    end

    it 'should has middleName key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:middleName)
      end
    end

    it 'should has email key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:email)
      end
    end

    it 'should has courseEnrollments key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:courseEnrollments)
      end
    end

    it 'should has courseEnrollments[:enrolment] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0]).to respond_to(:enrollment)
      end
    end

    it 'should has courseEnrollments should be Array' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments).to be_an_instance_of(Array)
      end
    end

    it 'should has courseEnrollments[:startDate] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0].enrollment).to respond_to(:startDate)
      end
    end

    it 'should has courseEnrollments[:courseID] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0].enrollment).to respond_to(:courseID)
      end
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
      end
    end

    it 'should has courseEnrollments[:role] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0].enrollment).to respond_to(:role)
      end
    end

    it 'should has courseEnrollments[:endDate] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.courseEnrollments[0].enrollment).to respond_to(:endDate)
      end
    end

    it 'should has address key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher).to respond_to(:address)
      end
    end

    it 'should has address[:street2] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.address).to respond_to(:street2)
      end
    end

    it 'should has address[:street1] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.address).to respond_to(:street1)
      end
    end

    it 'should has address[:zip] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.address).to respond_to(:zip)
      end
    end

    it 'should has address[:state] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.address).to respond_to(:state)
      end
    end

    it 'should has address[:city] key' do
      VCR.use_cassette('teachers') do
        expect(teachers.data[0].teacher.address).to respond_to(:city)
      end
    end

    it 'should has total key' do
      VCR.use_cassette('teachers') do
        expect(teachers).to respond_to(:total)
      end
    end

    it 'should has page key' do
      VCR.use_cassette('teachers') do
        expect(teachers).to respond_to(:page)
      end
    end
  end

  context '#courses' do
    let(:courses){ Edelements.students.courses(edelements_student_id) }

    it "should return not empty array" do
      VCR.use_cassette('courses') do
        expect(courses.data).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("courses") do
        expect(courses.data).to be_an_instance_of( Array )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('courses') do
        expect(courses.data.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:id)
      end
    end

    it 'should has schoolID key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:schoolID)
      end
    end

    it 'should has name key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:name)
      end
    end

    it 'should has schoolYear key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:schoolYear)
      end
    end

    it 'should has properties key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:properties)
      end
    end

    it 'should has lastUpdate key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:lastUpdate)
      end
    end

    it 'should has total key' do
      VCR.use_cassette('courses') do
        expect(courses).to respond_to(:total)
      end
    end

    it 'should has page key' do
      VCR.use_cassette('courses') do
        expect(courses).to respond_to(:page)
      end
    end
  end

  context '#events' do
    let(:events){ Edelements.students.events(edelements_student_id) }

    it "should return not empty array" do
      VCR.use_cassette('events') do
        expect(events.data).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("events") do
        expect(events.data).to be_an_instance_of( Array )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('events') do
        expect(events.data.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events).to respond_to(:id)
      end
    end

    it 'should has timestamp key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events).to respond_to(:timestamp)
      end
    end

    it 'should has eventtype key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events).to respond_to(:eventtype)
      end
    end

    it 'should has eventaction key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events).to respond_to(:eventaction)
      end
    end

    it 'should has params key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events).to respond_to(:params)
      end
    end

    it 'should params[:courseID] key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events.params).to respond_to(:courseID)
      end
    end

    it 'should params[:userID] key' do
      VCR.use_cassette('events') do
        expect(events.data[0].events.params).to respond_to(:userID)
      end
    end

    it 'should has total key' do
      VCR.use_cassette('events') do
        expect(events).to respond_to(:total)
      end
    end

    it 'should has page key' do
      VCR.use_cassette('events') do
        expect(events).to respond_to(:page)
      end
    end
  end

  context '#photo' do
    pending 'not working in server side'
  end

  context '#activity' do
    pending 'not working in server side'
  end
end