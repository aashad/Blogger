class ArticlesController < ApplicationController
include ArticlesHelper
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		# @article = Article.new(params[:article])
		@article.save
	
		# @article = Article.new(
		# title: params[:article][:title],
		# body: params[:article][:body])
		# @article.save
		
		# @article = Article.new
		# @article.title = params[:article][:title]
		# @article.save
		
		flash.notice = "Article '#{@article.title}' Created!"
		
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:id])

		@article.destroy
		
		flash.notice = "Article '#{@article.title}' Destroyed!"

		redirect_to articles_path
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end
	
	
	
	
	
end