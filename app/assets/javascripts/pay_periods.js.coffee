# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  widthOfDiv = 300
  netIncome = document.getElementById("pay_period_net_income").value
  balanceString = document.getElementById("pay_period_balance").innerText
  balance = parseFloat(balanceString.split(" ")[1])
  percentageSpent = 1 - (balance / netIncome)
  progressBar = document.getElementById("balance_progress")
  $(progressBar).width( $(progressBar).width()+(percentageSpent * widthOfDiv) )
  progressBar.innerText = Math.floor(percentageSpent * 100) + "%"
