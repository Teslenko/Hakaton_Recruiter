class StaticPagesController < ApplicationController
  def home

    @candidates = Candidate.all


  end

  def help
  end

  def about
  end

  def contact
  end
end
