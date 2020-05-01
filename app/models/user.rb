class User < ApplicationRecord
  after_create :create_tenant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
