class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    @person.role = 'user'
    if @person.save
      session[:user_id] = @person.id
      redirect_to (stored_location || @person), notice: "#{@person.name} was successfully registered."
    else
      render action: "new"
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to @person, notice: "#{@person.name}'s account was successfully updated."
    else
      render action: "edit", notice: "#{@person.name}'s account was not updated."
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url
  end
end
