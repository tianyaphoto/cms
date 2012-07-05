# -*- encoding: utf-8 -*-
class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => "show"
  
  layout "admin.html.erb"

  before_filter  :init_navigation, :only => "show"

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @current_c = @category
    @category_child =  @category.depth == 1 ?  @current_c.children  : @current_c.parent.children
    respond_to do |format|
      format.html {
      }
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        page = Page.new(:content => @category.content )
        page.category = @category
        page.save
        
        format.html { redirect_to @category, notice: '目录创建成功.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
    #page = @category.page
    respond_to do |format|
      if @category.update_attributes(params[:category])
        
        #page.update_attribute(:content, @category.content) if page
        #Rails.logger.info page.inpsect

        format.html { redirect_to @category, notice: '目录修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
