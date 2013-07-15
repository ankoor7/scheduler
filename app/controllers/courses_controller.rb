class CoursesController < ApplicationController
  def index
    # @courses = @q.result(distinct: true)
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end


  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render action: "edit", notice: 'Course was not updated.'
    end
  end


  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_url
  end


end
