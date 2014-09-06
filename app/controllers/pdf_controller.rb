class PdfController < ActionController::Base
  
  def create
    if check_permissions!
      r = Registrant.new
      r.assign_attributes(params[:registrant])
      if r.valid?
        r.generate_pdf(true)
        render json: {"generated" => r.pdf_path}.to_json
      else
        puts r.errors.to_json
        render json: r.errors.to_json, status: 400
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