class AnnouncementsController < ApplicationController
  include Authorization
  
  before_action :set_announcement, only: [:destroy]
  before_action :require_management_permission, only: [:new, :create, :destroy]

  def new     
    @classroom = Classroom.find(params[:classroom_id])
    @announcement = @classroom.announcements.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @announcement = @classroom.announcements.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to classroom_path(@announcement.classroom), notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classroom = @announcement.classroom
    @announcement.destroy!

    respond_to do |format|
      format.html { redirect_to classroom_path(@classroom), notice: "Announcement was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end
end