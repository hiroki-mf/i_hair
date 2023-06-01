class Admin::HomesController < ApplicationController
  def top
    @cosmetics = Cosmetic.all
  end
end
