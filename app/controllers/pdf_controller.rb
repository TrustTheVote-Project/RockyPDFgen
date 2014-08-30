class PdfController < ActionController::Base
  
  def create
    if check_permissions!
      r = Registrant.new
      r.assign_attributes(params[:registrant])
      if r.valid?
        r.generate_pdf
        render json: {"generated" => r.pdf_path}.to_json
      else
        render json: r.errors.to_json
      end
    end
  end
  
private
  def check_permissions!
    RockyConf.clients.each do |client|
      if client.id == params[:client_id] && client.key == params[:key]
        return true
      end
    end
    render json: {error: "invalid client_id or key"}.to_json, status: 401
    return false
  end
  
end