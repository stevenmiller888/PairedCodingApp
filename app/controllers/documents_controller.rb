# Timeout in for help in sandboxing the code evaluation
require 'timeout'

class DocumentsController < ApplicationController

  def index
    @document = Document.where(friendship_id: params["document"]["friendship_id"], user_id: params["document"]["user_id"])[0]
    respond_to do |format|
      format.json { render json: @document, status: :ok}
    end
  end

  def update
    @document = Document.where(friendship_id: params["document"]["friendship_id"], user_id: current_user.id)[0]
    updated_attributes = params.require(:document).permit(:text, :friendship_id, :user_id)
    @document.update_attributes(updated_attributes)
    respond_to do |format|
      format.json { render json: @document, status: :ok }
    end
  end

  def run
    @code_sample = params[:text]
    std_output = StringIO.new
    std_error = StringIO.new

    # If the interpreter takes longer than 20 seconds, assume we are in an
    # infinite loop and terminate.
    Timeout.timeout(20) do
      begin
        $stdout = std_output
        $stderr = std_error
        # Safely evaluate the code within a sandbox at level 3 safety
        @code_result = safe(:level => 3) { eval @code_sample }
      rescue SyntaxError => se
        @syntax_error = se
      rescue NameError => ne
        @syntax_error = ne
      rescue TypeError => te
        @syntax_error = te
      rescue ArgumentError => ae
        @syntax_error = ae
      ensure
        $stdout = STDOUT
        $stderr = STDERR
      end
    end

    @std_error = std_error.string
    @std_output = std_output.string

    @code_result = {"code" => @code_result}
    @syntax_error = {"code" => @syntax_error.to_s}
    @std_output = {"code" => @std_output}
   
    if @std_output["code"] != ""
      respond_to do |format|
        format.json { render json: @std_output, status: :ok }
      end
    else
      if @syntax_error["code"] == ""
        respond_to do |format|
          format.json { render json: @code_result, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: @syntax_error, status: :ok }
        end
      end
    end
  end

end
