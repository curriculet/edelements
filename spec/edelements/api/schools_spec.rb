require 'spec_helper'

describe Edelements::Api::Schools do

  before { set_testing_configuration }

  context '#show' do
    let(:school){ Edelements.schools.show(edelements_school_id) }

    it "should return result" do
      VCR.use_cassette("schools") do
        expect(school).to_not be_nil
      end
    end

    it 'should be hash' do
      VCR.use_cassette("schools") do
        expect(school).to be_an_instance_of( Edelements::School )
      end
    end

    it 'should has id key' do
      VCR.use_cassette('schools') do
        expect(school).to respond_to(:id)
      end
    end

    it 'should has name key' do
      VCR.use_cassette('schools') do
        expect(school).to respond_to(:name)
      end
    end

    it 'should has address key' do
      VCR.use_cassette('schools') do
        expect(school).to respond_to(:address)
      end
    end

    it 'should has address[:street2] key' do
      VCR.use_cassette('schools') do
        expect(school.address).to respond_to(:street2)
      end
    end

    it 'should has address[:zip] key' do
      VCR.use_cassette('schools') do
        expect(school.address).to respond_to(:zip)
      end
    end

    it 'should has address[:street1] key' do
      VCR.use_cassette('schools') do
        expect(school.address).to respond_to(:street1)
      end
    end

    it 'should has address[:state] key' do
      VCR.use_cassette('schools') do
        expect(school.address).to respond_to(:state)
      end
    end

    it 'should has address[:city] key' do
      VCR.use_cassette('schools') do
        expect(school.address).to respond_to(:city)
      end
    end

    it 'should has properties key' do
      VCR.use_cassette('schools') do
        expect(school).to respond_to(:properties)
      end
    end
  end

  context '#teachers' do
    let(:teachers){ Edelements.schools.teachers(edelements_school_id) }

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
    let(:courses){ Edelements.schools.courses(edelements_school_id) }

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

    it 'should has teacherEnrollments key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:teacherEnrollments)
      end
    end

    it 'should has teacherEnrollments[:enrolment] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0]).to respond_to(:enrollment)
      end
    end

    it 'should has teacherEnrollments should be Array' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments).to be_an_instance_of(Array)
      end
    end

    it 'should has teacherEnrollments[:startDate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0].enrollment).to respond_to(:startDate)
      end
    end

    it 'should has teacherEnrollments[:userID] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0].enrollment).to respond_to(:userID)
      end
    end

    it 'should has teacherEnrollments[:lastUpdate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0].enrollment).to respond_to(:lastUpdate)
      end
    end

    it 'should has teacherEnrollments[:role] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0].enrollment).to respond_to(:role)
      end
    end

    it 'should has teacherEnrollments[:endDate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.teacherEnrollments[0].enrollment).to respond_to(:endDate)
      end
    end

    it 'should has studentEnrollments key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course).to respond_to(:studentEnrollments)
      end
    end

    it 'should has studentEnrollments[:enrolment] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0]).to respond_to(:enrollment)
      end
    end

    it 'should has studentEnrollments should be Array' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments).to be_an_instance_of(Array)
      end
    end

    it 'should has studentEnrollments[:startDate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0].enrollment).to respond_to(:startDate)
      end
    end

    it 'should has studentEnrollments[:userID] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0].enrollment).to respond_to(:userID)
      end
    end

    it 'should has studentEnrollments[:lastUpdate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0].enrollment).to respond_to(:lastUpdate)
      end
    end

    it 'should has studentEnrollments[:role] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0].enrollment).to respond_to(:role)
      end
    end

    it 'should has studentEnrollments[:endDate] key' do
      VCR.use_cassette('courses') do
        expect(courses.data[0].course.studentEnrollments[0].enrollment).to respond_to(:endDate)
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

  context '#students' do
    let(:students){ Edelements.schools.students(edelements_school_id) }

    it "should return not empty array" do
      VCR.use_cassette("students") do
        expect(students.data).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("students") do
        expect(students.data).to be_an_instance_of( Array )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('students') do
        expect(students.data.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:id)
      end
    end

    it 'should has schoolID key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:schoolID)
      end
    end

    it 'should has firstName key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:firstName)
      end
    end

    it 'should has lastName key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:lastName)
      end
    end

    it 'should has middleName key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:middleName)
      end
    end

    it 'should has email key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:email)
      end
    end

    it 'should has number key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:number)
      end
    end

    it 'should has gradeLevel key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:gradeLevel)
      end
    end

    it 'should has courseEnrollments key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:courseEnrollments)
      end
    end

    it 'should has courseEnrollments[:enrolment] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0]).to respond_to(:enrollment)
      end
    end

    it 'should has courseEnrollments should be Array' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments).to be_an_instance_of(Array)
      end
    end

    it 'should has courseEnrollments[:startDate] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0].enrollment).to respond_to(:startDate)
      end
    end

    it 'should has courseEnrollments[:courseID] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0].enrollment).to respond_to(:courseID)
      end
    end

    it 'should has courseEnrollments[:lastUpdate] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0].enrollment).to respond_to(:lastUpdate)
      end
    end

    it 'should has courseEnrollments[:role] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0].enrollment).to respond_to(:role)
      end
    end

    it 'should has courseEnrollments[:endDate] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.courseEnrollments[0].enrollment).to respond_to(:endDate)
      end
    end

    it 'should has address key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student).to respond_to(:address)
      end
    end

    it 'should has address[:street2] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.address).to respond_to(:street2)
      end
    end

    it 'should has address[:street1] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.address).to respond_to(:street1)
      end
    end

    it 'should has address[:zip] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.address).to respond_to(:zip)
      end
    end

    it 'should has address[:state] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.address).to respond_to(:state)
      end
    end

    it 'should has address[:city] key' do
      VCR.use_cassette('students') do
        expect(students.data[0].student.address).to respond_to(:city)
      end
    end

    it 'should has total key' do
      VCR.use_cassette('students') do
        expect(students).to respond_to(:total)
      end
    end

    it 'should has page key' do
      VCR.use_cassette('students') do
        expect(students).to respond_to(:page)
      end
    end
  end

  context '#events' do
    pending 'not working in server side'
  end
end
