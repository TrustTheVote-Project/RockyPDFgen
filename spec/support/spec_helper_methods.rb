
module SpecHelperMethods

  def fixture_files_path
    Rails.root.join("spec/fixtures/files")
  end
  
  def fixture_file_contents(path)
    c = ''
    File.open(fixture_files_path.join(path)) do |f|
      c = f.read
    end
    c
  end

  def fixture_files_file_upload(path, mime_type = nil, binary = false)
    Rack::Test::UploadedFile.new("#{fixture_files_path}#{path}", mime_type, binary)    
  end

  def maximal_registrant
    r = Registrant.new
    r.assign_attributes({
      locale:              "en",
      pdf_date_of_birth:       20.years.ago.to_date.strftime("%m/%d/%Y"),
      email_address:       "citizen@example.com",
      home_zip_code:       "02134",
      us_citizen:          true,
      name_title:          "Mrs.", 
      name_title_key:          "mrs",
      first_name:          "Susan",
      middle_name:         "Brownell",
      last_name:           "Anthony",
      name_suffix:         "III",
      name_suffix_key:         "iii",
      home_address:        "123 Civil Rights Way",
      home_unit:           "Apt 2",
      home_city:           "West Grove",
      # home_state          { GeoState['MA'] }
      home_state_id:       "MA",
      # has_mailing_address true
      mailing_address:     "10 Main St",
      mailing_unit:        "Box 5",
      mailing_city:        "Adams",
      mailing_state_id:    'MA',
      mailing_zip_code:    "02135",
      #party:               "Decline to State",
      english_party_name:  "Decline to State",
      pdf_english_race:    "White (not Hispanic)",
      #race:                "White (not Hispanic)",
      state_id_number:     "NONE",
      phone:               "123-456-7890",
      # phone_type          "Mobile"
      # change_of_name:      true
      prev_name_title:      "Ms.",
      prev_name_title_key:     "ms",
      prev_first_name:     "Susana",
      prev_middle_name:    "B.",
      prev_last_name:      "Antonia",
      prev_name_suffix:     "Jr.",
      prev_name_suffix_key:    "jr",
      # change_of_address   true
      prev_address:        "321 Civil Wrongs Way",
      prev_unit:           "#9",
      prev_city:           "Pittsburgh",
      prev_state_id:        'PA',
      prev_zip_code:       "15215",
      registration_instructions_url: "a-url",
      will_be_18_by_election: true,
      pdf_barcode: "XYC-ABC"
    })
    return r
  end

end