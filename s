[33mcommit 91815d1538f5daf35625f37edeab712094be91d8[m
Author: Antti Moi <anttimoi@hotmail.com>
Date:   Tue Oct 15 12:42:39 2013 +0300

    Finish static-pages

[1mdiff --git a/app/controllers/static_pages_controller.rb b/app/controllers/static_pages_controller.rb[m
[1mindex c76b925..49ccd41 100644[m
[1m--- a/app/controllers/static_pages_controller.rb[m
[1m+++ b/app/controllers/static_pages_controller.rb[m
[36m@@ -1,7 +1,11 @@[m
 class StaticPagesController < ApplicationController[m
[32m+[m
   def home[m
   end[m
 [m
   def help[m
   end[m
[32m+[m
[32m+[m[32m  def about[m
[32m+[m[32m  end[m
 end[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 6dbc7c2..730ba6b 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -1,8 +1,9 @@[m
 <!DOCTYPE html>[m
 <html>[m
 <head>[m
[31m-  <title>SampleApp</title>[m
[31m-  <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>[m
[32m+[m[32m  <title>Ruby on Rails Tutorial Sample App | <%= yield(:title) %></title>[m
[32m+[m[32m  <%= stylesheet_link_tag    "application", media: "all",[m
[32m+[m[32m                                            "data-turbolinks-track" => true %>[m
   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>[m
   <%= csrf_meta_tags %>[m
 </head>[m
[1mdiff --git a/app/views/static_pages/about.html.erb b/app/views/static_pages/about.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..c18c8ed[m
[1m--- /dev/null[m
[1m+++ b/app/views/static_pages/about.html.erb[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32m<% provide(:title, 'About Us') %>[m[41m[m
[32m+[m[32m<h1>About Us</h1>[m[41m[m
[32m+[m[32m<p>[m[41m[m
[32m+[m[32m  The <a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>[m[41m[m
[32m+[m[32m  is a project to make a book and screencasts to teach web development[m[41m[m
[32m+[m[32m  with <a href="http://rubyonrails.org/">Ruby on Rails</a>. This[m[41m[m
[32m+[m[32m  is the sample application for the tutorial.[m[41m[m
[32m+[m[32m</p>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/static_pages/help.html.erb b/app/views/static_pages/help.html.erb[m
[1mindex 61896f5..9ce12e4 100644[m
[1m--- a/app/views/static_pages/help.html.erb[m
[1m+++ b/app/views/static_pages/help.html.erb[m
[36m@@ -1,2 +1,8 @@[m
[31m-<h1>StaticPages#help</h1>[m
[31m-<p>Find me in app/views/static_pages/help.html.erb</p>[m
[32m+[m[32m<% provide(:title, 'Help') %>[m
[32m+[m[32m<h1>Help</h1>[m
[32m+[m[32m<p>[m
[32m+[m[32m  Get help on the Ruby on Rails Tutorial at the[m
[32m+[m[32m  <a href="http://railstutorial.org/help">Rails Tutorial help page</a>.[m
[32m+[m[32m  To get help on this sample app, see the[m
[32m+[m[32m  <a href="http://railstutorial.org/book">Rails Tutorial book</a>.[m
[32m+[m[32m</p>[m
[1mdiff --git a/app/views/static_pages/home.html.erb b/app/views/static_pages/home.html.erb[m
[1mindex af94c7f..c1a21b2 100644[m
[1m--- a/app/views/static_pages/home.html.erb[m
[1m+++ b/app/views/static_pages/home.html.erb[m
[36m@@ -1,2 +1,7 @@[m
[31m-<h1>StaticPages#home</h1>[m
[31m-<p>Find me in app/views/static_pages/home.html.erb</p>[m
[32m+[m[32m<% provide(:title, 'Home') %>[m
[32m+[m[32m<h1>Sample App</h1>[m
[32m+[m[32m<p>[m
[32m+[m[32m  This is the home page for the[m
[32m+[m[32m  <a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>[m
[32m+[m[32m  sample application.[m
[32m+[m[32m</p>[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 54692a8..e27d5fa 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,6 +1,7 @@[m
 SampleApp::Application.routes.draw do[m
   get "static_pages/help"[m
   get "static_pages/home"[m
[32m+[m[32m  get "static_pages/about"[m
   # The priority is based upon order of creation: first created -> highest priority.[m
   # See how all your routes lay out with "rake routes".[m
 [m
[1mdiff --git a/spec/requests/static_pages_spec.rb b/spec/requests/static_pages_spec.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..2d4deef[m
[1m--- /dev/null[m
[1m+++ b/spec/requests/static_pages_spec.rb[m
[36m@@ -0,0 +1,43 @@[m
[32m+[m[32mrequire 'spec_helper'[m
[32m+[m
[32m+[m[32mdescribe "Static pages" do[m
[32m+[m
[32m+[m[32m  describe "Home page" do[m
[32m+[m
[32m+[m[32m    it "should have the content 'Sample App'" do[m
[32m+[m[32m      visit '/static_pages/home'[m
[32m+[m[32m      expect(page).to have_content('Sample App')[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    it "should have the title 'Home'" do[m
[32m+[m[32m      visit '/static_pages/home'[m
[32m+[m[32m      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe "Help page" do[m
[32m+[m
[32m+[m[32m    it "should have the content 'Help'" do[m
[32m+[m[32m      visit '/static_pages/help'[m
[32m+[m[32m      expect(page).to have_content('Help')[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    it "should have the title 'Help'" do[m
[32m+[m[32m      visit '/static_pages/help'[m
[32m+[m[32m      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe "About page" do[m
[32m+[m
[32m+[m[32m    it "should have the content 'About Us'" do[m
[32m+[m[32m      visit '/static_pages/about'[m
[32m+[m[32m      expect(page).to have_content('About Us')[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    it "should have the title 'About Us'" do[m
[32m+[m[32m      visit '/static_pages/about'[m
[32m+[m[32m      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/spec/spec_helper.rb b/spec/spec_helper.rb[m
[1mindex 943bc19..031f92c 100644[m
[1m--- a/spec/spec_helper.rb[m
[1m+++ b/spec/spec_helper.rb[m
[36m@@ -39,4 +39,5 @@[m [mRSpec.configure do |config|[m
   # the seed, which is printed after each run.[m
   #     --seed 1234[m
   config.order = "random"[m
[32m+[m[32m  config.include Capybara::DSL[m
 end[m
