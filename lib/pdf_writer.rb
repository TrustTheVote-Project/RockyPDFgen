require 'rubygems'
require 'active_support'
require 'active_support/all'
require 'wkhtmltopdf-binary'
require 'wicked_pdf'

class PdfWriter
  @queue = :pdf_writers
  
  def self.perform(html_string, path, locale, pdf_file_dir, force_write = false)
    if !File.exists?(path) || force_write
        pdf = WickedPdf.new.pdf_from_string(
        html_string,
        :disable_internal_links         => false,
        :disable_external_links         => false,
        :encoding => 'utf8',
        :locale=>locale
      )      
      FileUtils.mkdir_p(pdf_file_dir)
      File.open(path, "w") do |f|
        f << pdf.force_encoding('UTF-8')
      end
    end
  end
    
    
end