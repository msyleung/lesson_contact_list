class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:success] = "Succesfulyl created new contact"
  		redirect_to contacts_path
  	else
  		render 'new'
  	end
  end

  def show
    find_contact
  end

  def edit
    find_contact
  end

  def update
    find_contact
    if @contact.update_attributes(contact_params)
      redirect_to contacts_path
      flash[:success] = "Update Success!"
    else
      render :edit
    end
  end

  def destroy
    find_contact
    @contact.destroy
    redirect_to contacts_path
    flash[:success] = "Contact deleted"
  end

  private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
  	params.require(:contact).permit(:name, :email, :company, :address, :phone)
  end
  
end
