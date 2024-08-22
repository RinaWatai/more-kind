class Admin::TagsController < ApplicationController
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
        redirect_to admin_facilities_path
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
      Tag.find(tag_id).destroy
    end
    
    redirect_to admin_tags_path
  end
  
  def edit
  end
  
end
