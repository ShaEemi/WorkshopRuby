class ContactsController < ApplicationController

    def new
        @page_title = "Contacter"
    end

    def index
        @page_title = "Tous les contacts"
       @contacts = Contact.all
    end


def create
  @contact = Contact.new(contact_params)
  @contact.save
  flash[:notice] = "Le message a bien été envoyé"
  flash[:color]  = "success"
  redirect_to new_contact_path
end

private
  def contact_params
    params.require(:contact).permit(:co_nom, :co_email, :co_sujet, :co_message)
  end
end
