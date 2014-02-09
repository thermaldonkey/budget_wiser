class RegistrationsController < Devise::RegistrationsController
  def create
    allowance = params["user"].delete("allowance")
    if allowance[0] == "."
      allowance = "0" + allowance
    end
    params["user"]["allowance"] = allowance
    pay_days = params["user"].delete("pay_days")
    params["user"]["pay_days"] = pay_days.split(", ")
    super
  end
end
