class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @tag = Tag.new
  end
  
  def index
    @tags = Tag.all
  end
    
  def create
    tag = Tag.new(name: params[:tag][:name])
    existing_tag = Tag.find_by(name: tag.name)
    if existing_tag.nil?
      if tag.save
        redirect_to admin_tags_path
      else
        redirect_to admin_tags_path
      end
    else
      redirect_to admin_tags_path
    end
  end

  def destroy
    @tag = Tag.find(name: params[:tag][:name])
    if Tag.destoy(name: params[:tag][:name])
      redirect_to admin_facilities_path
    else
      redirect_to admin_tags_path
    end
  end
  
  def delete_all
    tag_ids = params[:tag][:id]
    tag_ids.delete_if(&:empty?).each do |tag_id|
      Facility.all.each do |f|
        f.tag_list.remove(Tag.find(tag_id).name)
        f.save
      end
      Tag.find(tag_id).destroy
    end
    redirect_to admin_tags_path
  end
  
end
